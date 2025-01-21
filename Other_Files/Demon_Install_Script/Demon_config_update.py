"""
requires:
    - rich : install using `python3 -m pip install rich`
    - configupdater : `python3 -m pip install ConfigUpdater`

"""

"""
usage: `python3 ~/printer_data/config/Demon_Klipper_Essentials_Unified/Other_Files/Demon_Install_Script/Demon_config_update.py`

"""

import importlib.util
import sys

# Function to check if dependencies are installed and provide the command to install them
def check_dependencies():
    """Check if required packages are installed"""
    required_packages = {
        'rich': 'python3 -m pip install rich',
        'configupdater': 'python3 -m pip install ConfigUpdater'
    }
    
    missing_packages = []
    
    for package, install_cmd in required_packages.items():
        if importlib.util.find_spec(package) is None:
            missing_packages.append((package, install_cmd))
    
    if missing_packages:
        print("Missing required packages:")
        for package, install_cmd in missing_packages:
            print(f"- {package}: Install using `{install_cmd}`")
        print("\nPlease install the missing packages and try again.")
        sys.exit(1)

# Check dependencies before importing them
check_dependencies()

from configupdater import ConfigUpdater
import os
import re
from pathlib import Path

# Python rich
from rich.console import Console
console = Console()

from rich.traceback import install
install(show_locals=False)

from rich import print
from rich.prompt import Prompt

# Paths to the configuration files
# TODO list all demon_user_settings_v#.#.#.cfg in the folder,
#  use the latest one,
#  then ask if this is the one the user wants to migrate,
#  continue in descending order of version,
#  If the last file is not accepted, print a joke saying the user should make-up his mind. and use the :exploding_head:
OLD_CONFIG_PATH = os.path.expanduser("~/printer_data/config/Demon_User_Files/Previous_Versions/")
NEW_CONFIG_PATH = os.path.expanduser("~/printer_data/config/Demon_User_Files/")


# Extract version numbers from filename and return as tuple for sorting
def parse_version(filename: str) -> tuple:
    # Strip extension before trying to match
    basename = os.path.splitext(filename)[0]
    match = re.search(r'v(\d+)\.(\d+)\.(\d+)', basename)
    if match:
        return tuple(map(int, match.groups()))
    return (None, None, None)

# Find and select configuration files for migration.
# Returns tuple of (old_config_path, new_config_path)
def find_config_files() -> tuple[str, str]:
    base_path = NEW_CONFIG_PATH
    prev_versions_path = OLD_CONFIG_PATH
    
    # Find all config files in Previous_versions directory
    config_files = []
    print(prev_versions_path)
    if os.path.exists(prev_versions_path):
        for file in os.listdir(prev_versions_path):
            if file.startswith("demon_user_settings_v") and file.endswith(".cfg"):
                full_path = os.path.join(prev_versions_path, file)
                config_files.append(full_path)
    
    if not config_files:
        console.print("[red]No previous config files found in Previous_versions directory![/]")
        return None, None
    
    # Sort configs by version numbers in filename, newest first
    config_files.sort(key=lambda x: parse_version(os.path.basename(x)), reverse=True)
    
    # Find the new config file
    new_config = None
    for file in os.listdir(base_path):
        if file.startswith("demon_user_settings_v") and file.endswith(".cfg"):
            new_config = os.path.join(base_path, file)
            break
    
    if not new_config:
        console.print("[red]No new config file found in main directory![/]")
        return None, None
    
    # Ask user to select old config version
    console.rule("[yellow]Config Selection[/]")
    print(f"Found new config file: [green]{new_config}[/]")
    print("\nAvailable previous versions:")
    
    for i, path in enumerate(config_files, 1):
        version = ".".join(map(str, parse_version(os.path.basename(path))))
        print(f"[blue]{i}[/]. Version {version} - {os.path.basename(path)}")
    
    jokes = [
        "Looks like someone's having a hard time making up their mind! 🤯",
        "Decision making isn't your strong suit today, is it? 🤯",
        "Eeny, meeny, miny... oh nevermind! 🤯",
        "Let's just go with the newest one before we both get grey hair! 🤯"
    ]
    
    selected_config = None
    for i, path in enumerate(config_files):
        version = ".".join(map(str, parse_version(os.path.basename(path))))
        choice = Prompt.ask(
            f"\nUse version {version}?",
            choices=["y", "n"],
            default="y"
        )
        
        if choice == 'y':
            selected_config = path
            break
        
        # If we've reached the last config and still no selection
        if i == len(config_files) - 1 and choice == 'n':
            joke = jokes[hash(str(config_files)) % len(jokes)]  # Deterministic joke selection
            console.print(f"\n[yellow]{joke}[/]")
            selected_config = config_files[0]  # Use the newest version
            version = ".".join(map(str, parse_version(os.path.basename(selected_config))))
            print(f"[blue]Using the newest version: {version}[/]")
    
    return selected_config, new_config

# Function to load a configuration file
def load_config(file_path):
    updater = ConfigUpdater()
    updater.read(file_path)
    return updater


# Function to save a configuration file
def save_config(updater, file_path):
    with open(file_path, "w") as f:
        updater.write(f)


def ask_file_path():
    while True:
        # Prompt the user for the file path
        file_path = Prompt.ask("Please enter the full file path and name")

        # Validate the input (e.g., check if it's a valid path)
        path = Path(file_path)
        if path.parent.exists():
            return file_path
        else:
            print(f"[red]Invalid path:[/red] {file_path}. Please try again.")


# Helper function to extract clean value
def get_value_parts(option):
    r={}
    
    if '#' in option:
        splitted_line = option.split('#', 1)
        r['raw_value'] = splitted_line[0].strip()
        r['comment_offset'] = len(splitted_line[0])-1
        r['comment'] = '#' + splitted_line[1]
    else:
        r['raw_value'] = option.strip()
        r['comment_offset'] = len(r['raw_value'])
        r['comment'] = ''

    return r

def get_value_line(value, offset, comment):
    padding = max(0, offset - len(value))
    return value + ( ' ' * padding) + comment

# Function to compare and merge configurations
def compare_and_merge_configs(old_config, new_config, output_path):

    console.rule(f":exclamation: Informations :exclamation:")
    print(f":grey_exclamation: [blue]Old value[1] is the value from your config backup at {OLD_CONFIG_PATH}")
    print(f":grey_exclamation: [green]New value[1] is the value from the new config template already copied at {NEW_CONFIG_PATH}\n")

    # Iterate through all sections in the new config
    for section in new_config.sections():

        for key, item in new_config[section].items():
            if old_config.has_section(section) and old_config.has_option(section, key):
                old_value = get_value_parts(old_config[section][key].value)
                new_value = get_value_parts(new_config[section][key].value)

                if old_value['raw_value'] != new_value['raw_value'] and key != 'variable_demon_version':

                    # Prompt the user to choose the value
                    console.rule(f"Section: [yellow]\[{section}][/], key: [purple]{key}[/]")
                    print(f"[green]{new_value['comment']}[/]")
                    print(f"[blue]\[1][/] Old value: [blue]{old_value['raw_value']}[/]")
                    print(f"[green1]\[2][/] New value: [green1]{new_value['raw_value']}[/]")

                    choice = Prompt.ask(
                        "Which value do you want to keep? [blue]\[1][/] or [green1]\[2][/] or [red][q][/] to cancel and quit: ",
                        choices=["1", "2","q"],
                        default="2",
                    )

                    if choice == '1':
                        print(f"[blue]Old value[/] kept!\n")
                        new_config[section][key].value = get_value_line(old_value['raw_value'], new_value['comment_offset'], new_value['comment'])

                    elif choice == '2':
                        print(f"[green1]New value[/] kept!\n")
                    
                    elif choice == 'q':
                        print(f"[red]Operation Cancelled, no file was written![/]\n")
                        exit()


    # Save the merged configuration
    console.rule(f"Save config")
    choice = Prompt.ask(
        f"Do you want to overwrite [purple]\"{output_path}\"[/]? ",
        choices=["y", "n", "q"],
        default="y",
    )

    if choice == 'n':
        output_path=ask_file_path()
    
    elif choice == 'q':
        print(f"[red]Operation Cancelled, no file was written![/]\n")
        exit()

    save_config(new_config, output_path)
    print(f"Merged configuration saved to [purple]\"{output_path}\"[/]\n")
    console.rule(f"")

# Main function
def main():
    
    OLD_CONFIG_PATH, NEW_CONFIG_PATH = find_config_files()

    if not OLD_CONFIG_PATH or not NEW_CONFIG_PATH:
        console.print("[red]Error:[/] Unable to proceed without both config files.")
        return

    # Ensure old configuration exists
    if not os.path.exists(OLD_CONFIG_PATH):
        print(f"[red]Error:[/] {OLD_CONFIG_PATH} does not exist.")
        return

    # Ensure new configuration exists
    if not os.path.exists(NEW_CONFIG_PATH):
        print(f"[red]Error:[/] {NEW_CONFIG_PATH} does not exist.")
        return

    # Load configurations
    old_config = load_config(OLD_CONFIG_PATH)
    new_config = load_config(NEW_CONFIG_PATH)

    # Compare and merge
    compare_and_merge_configs(old_config, new_config, NEW_CONFIG_PATH)

if __name__ == "__main__":
    main()
