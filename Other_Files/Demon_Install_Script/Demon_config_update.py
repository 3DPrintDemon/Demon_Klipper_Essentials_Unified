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
from io import StringIO
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


# Get all .cfg files in the user config directory
def get_all_cfg_files() -> list[str]:
    base_path = NEW_CONFIG_PATH
    cfg_files = []
    
    if os.path.exists(base_path):
        for file in os.listdir(base_path):
            if file.endswith(".cfg"):
                full_path = os.path.join(base_path, file)
                cfg_files.append(full_path)
    
    # Sort files alphabetically for consistent display
    cfg_files.sort(key=lambda x: os.path.basename(x))
    return cfg_files


# Display menu and get user's file selection
def select_config_file() -> str:
    cfg_files = get_all_cfg_files()
    
    if not cfg_files:
        console.print("[red]No .cfg files found in the user config directory![/]")
        return None
    
    console.rule("[yellow]Config File Selection[/]")
    print("Available .cfg files in your config directory:")
    print()
    
    # Display numbered menu
    for i, file_path in enumerate(cfg_files, 1):
        filename = os.path.basename(file_path)
        print(f"[blue]{i:2}[/]. {filename}")
    
    print(f"[red]{len(cfg_files) + 1:2}[/]. [red]Cancel and quit[/]")
    print()
    
    # Get user choice
    while True:
        try:
            choice = Prompt.ask(
                f"Select a config file to update [1-{len(cfg_files)}] or [{len(cfg_files) + 1}] to cancel",
                default="1"
            )
            
            choice_num = int(choice)
            
            if 1 <= choice_num <= len(cfg_files):
                selected_file = cfg_files[choice_num - 1]
                console.print(f"[green]Selected:[/] {os.path.basename(selected_file)}")
                return selected_file
            elif choice_num == len(cfg_files) + 1:
                console.print("[red]Operation cancelled by user.[/]")
                return None
            else:
                console.print(f"[red]Invalid choice. Please enter a number between 1 and {len(cfg_files) + 1}[/]")
        except ValueError:
            console.print("[red]Invalid input. Please enter a valid number.[/]")


# Find and select configuration files for migration.
# Returns tuple of (old_config_path, new_config_path)
def find_config_files(target_config_file: str) -> tuple[str, str]:
    base_path = NEW_CONFIG_PATH
    prev_versions_path = OLD_CONFIG_PATH
    
    # Extract the base filename without version for matching
    target_filename = os.path.basename(target_config_file)
    
    # Find corresponding files in Previous_versions directory
    config_files = []
    if os.path.exists(prev_versions_path):
        for file in os.listdir(prev_versions_path):
            if file.endswith(".cfg"):
                # Check if this is a versioned file that matches our target
                base_name = get_base_filename(file)
                target_base_name = get_base_filename(target_filename)
                
                if base_name == target_base_name:
                    full_path = os.path.join(prev_versions_path, file)
                    config_files.append(full_path)
    
    if not config_files:
        console.print(f"[red]No previous versions found for {target_filename} in Previous_versions directory![/]")
        console.print("[yellow]This might be a new file or first-time setup.[/]")
        return None, target_config_file
    
    # Sort configs by version numbers in filename, newest first
    config_files.sort(key=lambda x: parse_version(os.path.basename(x)), reverse=True)
    
    # Ask user to select old config version
    console.rule("[yellow]Previous Version Selection[/]")
    print(f"Target config file: [green]{target_filename}[/]")
    print("\nAvailable previous versions:")
    
    for i, path in enumerate(config_files, 1):
        version = ".".join(map(str, parse_version(os.path.basename(path))))
        if version == "None.None.None":
            version = "Unknown"
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
        if version == "None.None.None":
            version = "Unknown"
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
            if version == "None.None.None":
                version = "Unknown"
            print(f"[blue]Using the newest version: {version}[/]")
    
    return selected_config, target_config_file


# Extract base filename without version numbers
def get_base_filename(filename: str) -> str:
    """Extract base filename by removing version pattern"""
    basename = os.path.splitext(filename)[0]
    # Remove version pattern like _v1.2.3
    base_name = re.sub(r'_v\d+\.\d+\.\d+$', '', basename)
    return base_name


# Function to load a configuration file
def load_config(file_path):
    updater = ConfigUpdater()
    updater.read(file_path)
    return updater


# Function to save a configuration file
def save_config(updater, file_path):
    config_string = StringIO()
    updater.write(config_string)

    with open(file_path, "w") as f:
        # Iterate through each line
        for line in config_string.getvalue().splitlines():
            # Perform your operation here
            # Example: modify the line or do some processing
            match = re.match(r'^\s*(\S*)\s*:(\s*.*)', line)
            
            if match:
                # Reconstruct line without spaces before colon
                processed_line = f"{match.group(1)}:{match.group(2)}"
                f.write(processed_line + '\n')
            else:
                # Write original line if no match
                f.write(line + '\n')


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
        r['comment_offset'] = len(splitted_line[0])
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


# Process a single config file update
def process_config_update(target_config_file: str) -> bool:
    """Process a single config file update. Returns True if successful, False otherwise."""
    
    OLD_CONFIG_PATH, NEW_CONFIG_PATH = find_config_files(target_config_file)

    if not NEW_CONFIG_PATH:
        console.print("[red]Error:[/] Unable to proceed without target config file.")
        return False

    # Ensure new configuration exists
    if not os.path.exists(NEW_CONFIG_PATH):
        console.print(f"[red]Error:[/] {NEW_CONFIG_PATH} does not exist.")
        return False

    # If no old config found, ask user if they want to continue with defaults
    if not OLD_CONFIG_PATH:
        choice = Prompt.ask(
            "No previous version found. Continue with default values?",
            choices=["y", "n"],
            default="y"
        )
        if choice == 'n':
            console.print("[yellow]Operation cancelled by user.[/]")
            return False
        
        console.print("[yellow]No comparison needed - using current file as-is.[/]")
        return True

    # Ensure old configuration exists
    if not os.path.exists(OLD_CONFIG_PATH):
        console.print(f"[red]Error:[/] {OLD_CONFIG_PATH} does not exist.")
        return False

    # Load configurations
    try:
        old_config = load_config(OLD_CONFIG_PATH)
        new_config = load_config(NEW_CONFIG_PATH)
    except Exception as e:
        console.print(f"[red]Error loading config files:[/] {str(e)}")
        return False

    # Compare and merge
    try:
        compare_and_merge_configs(old_config, new_config, NEW_CONFIG_PATH)
        return True
    except Exception as e:
        console.print(f"[red]Error during config merge:[/] {str(e)}")
        return False


# Main function with loop for multiple config updates
def main():
    console.rule("[bold blue]Demon Config Update Tool[/]")
    console.print("[green]Welcome to the Demon Config Update Tool![/]")
    console.print("This tool helps you merge settings from previous config versions into new ones.\n")
    
    while True:
        # Select config file to update
        target_config = select_config_file()
        
        if target_config is None:
            console.print("[yellow]No config file selected. Exiting.[/]")
            break
        
        # Process the selected config
        success = process_config_update(target_config)
        
        if success:
            console.print(f"[green]✓ Successfully processed {os.path.basename(target_config)}[/]")
        else:
            console.print(f"[red]✗ Failed to process {os.path.basename(target_config)}[/]")
        
        # Ask if user wants to update another config
        console.rule("[yellow]Continue?[/]")
        continue_choice = Prompt.ask(
            "Would you like to update another config file?",
            choices=["y", "n", "q"],
            default="n"
        )
        
        if continue_choice in ['n', 'q']:
            console.print("[blue]Thank you for using the Demon Config Update Tool![/]")
            break
    
    console.rule("[blue]Session Complete[/]")

if __name__ == "__main__":
    main()