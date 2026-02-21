"""
requires:
    - rich : install using `python3 -m pip install rich`
    - configupdater : `python3 -m pip install ConfigUpdater`

"""

"""
Command line options:
    --old-config PATH    Specify the old config file path directly
    --new-config PATH   Specify the new config file path directly
    --output PATH       Specify the output file path (optional, defaults to new-config path)
    --help             Show this help message

Usage Examples:
    # Interactive mode (default behavior, what most users will want to use)
    python3 ~/printer_data/config/Demon_Klipper_Essentials_Unified/Other_Files/Demon_Install_Script/Demon_config_update.py
    
    # Specify files directly (useful for testing the script while in development)
    python3 ~/printer_data/config/Demon_Klipper_Essentials_Unified/Other_Files/Demon_Install_Script/Demon_config_update.py --old-config /path/to/old.cfg --new-config /path/to/new.cfg
    
    # Specify files with custom output (useful for testing the script while in development)
    python3 ~/printer_data/config/Demon_Klipper_Essentials_Unified/Other_Files/Demon_Install_Script/Demon_config_update.py --old-config /path/to/old.cfg --new-config /path/to/new.cfg --output /path/to/output.cfg
"""

import importlib.util
import sys
import argparse
import difflib
from typing import Optional, Dict, Tuple, List

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


def parse_arguments():
    """Parse command line arguments"""
    parser = argparse.ArgumentParser(
        description="Demon Config Update Tool - Merge settings from previous config versions into new ones",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Usage Examples:
# Interactive mode (default behavior, what most users will want to use)
python3 ~/printer_data/config/Demon_Klipper_Essentials_Unified/Other_Files/Demon_Install_Script/Demon_config_update.py
    
# Specify files directly (useful for testing the script while in development)
python3 ~/printer_data/config/Demon_Klipper_Essentials_Unified/Other_Files/Demon_Install_Script/Demon_config_update.py --old-config /path/to/old.cfg --new-config /path/to/new.cfg
    
# Specify files with custom output (useful for testing the script while in development)
python3 ~/printer_data/config/Demon_Klipper_Essentials_Unified/Other_Files/Demon_Install_Script/Demon_config_update.py --old-config /path/to/old.cfg --new-config /path/to/new.cfg --output /path/to/output.cfg
        """
    )
    
    parser.add_argument(
        '--old-config',
        type=str,
        help='Path to the old config file (previous version)'
    )
    
    parser.add_argument(
        '--new-config',
        type=str,
        help='Path to the new config file (current version)'
    )
    
    parser.add_argument(
        '--output',
        type=str,
        help='Path for the output file (optional, defaults to new-config path)'
    )
    
    return parser.parse_args()


def validate_file_paths(args):
    """Validate the provided file paths"""
    errors = []
    
    if args.old_config and not os.path.exists(args.old_config):
        errors.append(f"Old config file not found: {args.old_config}")
    
    if args.new_config and not os.path.exists(args.new_config):
        errors.append(f"New config file not found: {args.new_config}")
    
    if args.output:
        output_dir = os.path.dirname(args.output)
        if output_dir and not os.path.exists(output_dir):
            errors.append(f"Output directory does not exist: {output_dir}")
    
    if errors:
        for error in errors:
            console.print(f"[red]Error:[/] {error}")
        return False
    
    return True

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
    target_base_name = get_base_filename(target_filename)

    # Find corresponding files in Previous_versions directory
    config_files = []
    if os.path.exists(prev_versions_path):
        for file in os.listdir(prev_versions_path):
            if file.endswith(".cfg"):
                # Check if this is a versioned file that matches our target
                base_name = get_base_filename(file)
                if base_name == target_base_name:
                    full_path = os.path.join(prev_versions_path, file)
                    config_files.append(full_path)
    
    if not config_files:
        # New file or first-time: fall back to demon_user_settings for variable migration when applicable
        if target_base_name == DEMON_USER_SETTINGS_FILAMENT_VARIABLES_BASE:
            # Filament variables were split out in v3.0.0; only a pre-v3.0.0 backup still has those vars.
            # Use only Previous_Versions so we don't use demon_user_settings_v3.0.0 (which no longer has them).
            fallback_path = get_latest_demon_user_settings_path_before_version(FILAMENT_VARIABLES_INTRODUCED_VERSION)
        else:
            fallback_path = get_latest_demon_user_settings_path()
        if fallback_path:
            console.print(f"[yellow]No previous versions of [bold]{target_filename}[/] found.[/]")
            console.print(f"[green]Using latest [bold]demon_user_settings[/] for migration[/] (some variables may have moved here):")
            console.print(f"  [blue]{os.path.basename(fallback_path)}[/]")
            return fallback_path, target_config_file
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


# Base name for the main user settings file (used as fallback when a new config has no previous version)
DEMON_USER_SETTINGS_BASE = "demon_user_settings"
# New file from v3.0.0: filament variables split out; use demon_user_settings as "old" only when that backup is prior to v3.0.0
DEMON_USER_SETTINGS_FILAMENT_VARIABLES_BASE = "demon_user_settings_filament_variables"
FILAMENT_VARIABLES_INTRODUCED_VERSION = (3, 0, 0)
DEMON_CUSTOM_EXPANSION_BASE = "demon_custom_expansion"
# Extract base filename without version numbers
def get_base_filename(filename: str) -> str:
    """Extract base filename by removing version pattern"""
    basename = os.path.splitext(filename)[0]
    # Remove version pattern like _v1.2.3
    base_name = re.sub(r'_v\d+\.\d+\.\d+$', '', basename)
    return base_name


def find_section_for_key(config, key: str):
    """Return the first section in config that contains the given key, or None if not found.
    Used to find a key in the old file regardless of section (handles reorganized/split sections).
    """
    for section in config.sections():
        if config.has_option(section, key):
            return section
    return None


def get_latest_demon_user_settings_path() -> Optional[str]:
    """Return the path to the latest demon_user_settings file by version.
    Looks in Previous_Versions first, then in the current user config directory.
    Used when migrating a new config file that has no previous version of the same name.
    """
    candidates = []
    for search_dir in (OLD_CONFIG_PATH, NEW_CONFIG_PATH):
        if not os.path.exists(search_dir):
            continue
        for file in os.listdir(search_dir):
            if not file.endswith(".cfg"):
                continue
            if get_base_filename(file) != DEMON_USER_SETTINGS_BASE:
                continue
            full_path = os.path.join(search_dir, file)
            candidates.append(full_path)
    if not candidates:
        return None
    # Sort by version descending (newest first); files without version sort last
    candidates.sort(key=lambda p: parse_version(os.path.basename(p)), reverse=True)
    return candidates[0]


def get_latest_demon_user_settings_path_before_version(max_version: tuple) -> Optional[str]:
    """Return the latest demon_user_settings file with version strictly less than max_version.
    Only searches Previous_Versions (backup folder), so the file still contains variables
    that may have been moved in later versions (e.g. filament vars moved out in v3.0.0).
    """
    if not os.path.exists(OLD_CONFIG_PATH):
        return None
    candidates = []
    for file in os.listdir(OLD_CONFIG_PATH):
        if not file.endswith(".cfg"):
            continue
        if get_base_filename(file) != DEMON_USER_SETTINGS_BASE:
            continue
        v = parse_version(file)
        if v[0] is None or v >= max_version:
            continue
        full_path = os.path.join(OLD_CONFIG_PATH, file)
        candidates.append(full_path)
    if not candidates:
        return None
    candidates.sort(key=lambda p: parse_version(os.path.basename(p)), reverse=True)
    return candidates[0]


# ---------------------------------------------------------------------------
# Multi-line option handling (e.g. gcode: blocks). ConfigUpdater cannot assign
# multi-line values; we parse raw files and offer a diff-style choice, then patch.
# ---------------------------------------------------------------------------

def parse_section_header(line: str):
    """Extract section name from a line like '[gcode_macro FOO]' or '[gcode_macro FOO] # comment'. Returns None if not a section line."""
    stripped = line.strip()
    if stripped.startswith('[') and ']' in stripped:
        return stripped[1:stripped.index(']')].strip()
    return None


def get_option_block_range_and_lines(file_path: str, section: str, key: str) -> Optional[Tuple[int, int, List[str]]]:
    """Parse a Klipper-style config file and return the line range and lines for one option's block.
    The block is the 'key:' line plus all following indented or blank lines until the next key/section.
    Returns (start_line_index, end_line_index_exclusive, list of lines including newlines), or None.
    """
    if not os.path.exists(file_path):
        return None
    with open(file_path, 'r') as f:
        lines = f.readlines()
    current_section = None
    i = 0
    while i < len(lines):
        line = lines[i]
        stripped = line.strip()
        sec = parse_section_header(line)
        if sec is not None:
            current_section = sec
            i += 1
            continue
        if current_section != section:
            i += 1
            continue
        # In the right section; check for key (key: or key: rest)
        if ':' in line and not stripped.startswith('#'):
            opt_name = line.split(':', 1)[0].strip()
            if opt_name == key:
                start = i
                i += 1
                while i < len(lines):
                    next_line = lines[i]
                    # Continue while line is empty or indented (continuation of value)
                    if next_line.strip() == '' or (next_line and next_line[0] in ' \t'):
                        i += 1
                    else:
                        break
                return (start, i, lines[start:i])
        i += 1
    return None


def show_multiline_diff_and_choose(
    old_lines: List[str],
    new_lines: List[str],
    section: str,
    key: str,
) -> List[str]:
    """Show a git-diff-like view of old vs new block and prompt [1] old or [2] new. Returns chosen lines."""
    console.rule(f"[yellow]Multi-line option: \[{section}][/] [purple]{key}[/]")
    print("[dim]Diff view (old = removed, new = added):[/]\n")
    # Unified diff: old as "removed", new as "added"
    diff = difflib.unified_diff(
        old_lines,
        new_lines,
        fromfile="old (your backup)",
        tofile="new (template)",
        lineterm="",
    )
    for d in diff:
        if d.startswith("---") or d.startswith("+++"):
            console.print(f"[dim]{d}[/]")
        elif d.startswith("-"):
            console.print(f"[red]{d}[/]")
        elif d.startswith("+"):
            console.print(f"[green]{d}[/]")
        else:
            console.print(f"[dim]{d}[/]")
    print()
    choice = Prompt.ask(
        "Which block do you want to keep? [blue][1][/] old (backup) or [green1][2][/] new (template) or [red][q][/] quit: ",
        choices=["1", "2", "q"],
        default="2",
    )
    if choice == "q":
        console.print("[red]Operation cancelled.[/]")
        sys.exit(0)
    if choice == "1":
        return list(old_lines)
    return list(new_lines)


# ---------------------------------------------------------------------------
# demon_custom_expansion: treat each [gcode_macro _CUSTOM_*] section as one unit, show one diff per section.
# ---------------------------------------------------------------------------

def is_expansion_macro_section(section_name: str) -> bool:
    """True if this section is an expansion hook macro (e.g. _CUSTOM_PRE_START), not the variables list."""
    if not section_name or not section_name.startswith("gcode_macro _CUSTOM_"):
        return False
    return "ACTIVE_LIST" not in section_name and "VERSION" not in section_name


def parse_file_into_macro_sections(file_path: str) -> List[Tuple[Optional[str], List[str]]]:
    """Parse a config file into (section_name, lines) list. section_name is None for preamble. Lines include newlines."""
    if not os.path.exists(file_path):
        return []
    with open(file_path, 'r') as f:
        lines = f.readlines()
    result = []
    preamble = []
    i = 0
    while i < len(lines):
        sec = parse_section_header(lines[i])
        if sec is not None:
            if preamble:
                result.append((None, preamble))
                preamble = []
            section_lines = [lines[i]]
            i += 1
            while i < len(lines) and parse_section_header(lines[i]) is None:
                section_lines.append(lines[i])
                i += 1
            result.append((sec, section_lines))
        else:
            preamble.append(lines[i])
            i += 1
    if preamble:
        result.append((None, preamble))
    return result


def show_section_diff_and_choose(
    old_lines: List[str],
    new_lines: List[str],
    section_name: str,
) -> List[str]:
    """Show unified diff for a full macro section and prompt [1] old or [2] new. Returns chosen lines."""
    console.rule(f"[yellow]Macro section: [purple]{section_name}[/]")
    print("[dim]Diff view (old = removed, new = added):[/]\n")
    diff = difflib.unified_diff(
        old_lines,
        new_lines,
        fromfile="old (your backup)",
        tofile="new (template)",
        lineterm="",
    )
    for d in diff:
        if d.startswith("---") or d.startswith("+++"):
            console.print(f"[dim]{d}[/]")
        elif d.startswith("-"):
            console.print(f"[red]{d}[/]")
        elif d.startswith("+"):
            console.print(f"[green]{d}[/]")
        else:
            console.print(f"[dim]{d}[/]")
    print()
    choice = Prompt.ask(
        "Which version do you want to keep? [blue][1][/] old (backup) or [green1][2][/] new (template) or [red][q][/] quit: ",
        choices=["1", "2", "q"],
        default="1",
    )
    if choice == "q":
        console.print("[red]Operation cancelled.[/]")
        sys.exit(0)
    if choice == "1":
        return list(old_lines)
    return list(new_lines)


def patch_macro_sections(
    output_path: str,
    chosen_sections: Dict[str, List[str]],
) -> None:
    """Replace whole macro sections in output_path with user-chosen content (for demon_custom_expansion)."""
    if not chosen_sections:
        return
    with open(output_path, 'r') as f:
        lines = f.readlines()
    to_patch = []
    i = 0
    while i < len(lines):
        sec = parse_section_header(lines[i])
        if sec is not None and sec in chosen_sections:
            start = i
            i += 1
            while i < len(lines) and parse_section_header(lines[i]) is None:
                i += 1
            to_patch.append((start, i, chosen_sections[sec]))
        else:
            i += 1
    for start, end, new_block in sorted(to_patch, key=lambda x: -x[0]):
        normalized = [ln if ln.endswith('\n') else ln + '\n' for ln in new_block]
        lines[start:end] = normalized
    with open(output_path, 'w') as f:
        f.writelines(lines)
    console.print("[green]Patched macro section(s) into saved file.[/]")


def patch_multi_line_blocks(
    output_path: str,
    chosen_blocks: Dict[Tuple[str, str], List[str]],
) -> None:
    """After saving, replace multi-line option blocks in output_path with user-chosen content."""
    if not chosen_blocks:
        return
    with open(output_path, 'r') as f:
        lines = f.readlines()
    to_patch = []
    current_section = None
    i = 0
    while i < len(lines):
        line = lines[i]
        stripped = line.strip()
        sec = parse_section_header(line)
        if sec is not None:
            current_section = sec
            i += 1
            continue
        if current_section and ':' in line and not stripped.startswith('#'):
            key = line.split(':', 1)[0].strip()
            if (current_section, key) in chosen_blocks:
                start = i
                i += 1
                while i < len(lines):
                    next_line = lines[i]
                    if next_line.strip() == '' or (next_line and next_line[0] in ' \t'):
                        i += 1
                    else:
                        break
                to_patch.append((start, i, chosen_blocks[(current_section, key)]))
                continue
        i += 1
    for start, end, new_block in sorted(to_patch, key=lambda x: -x[0]):
        normalized = [ln if ln.endswith('\n') else ln + '\n' for ln in new_block]
        lines[start:end] = normalized
    with open(output_path, 'w') as f:
        f.writelines(lines)
    console.print("[green]Patched multi-line option(s) into saved file.[/]")


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


def preserve_comments_and_save_config(updater, file_path, new_config_path, chosen_overrides=None):
    """Save using the new config file as the single source of structure and comments.
    Only the value part of each key line is taken from the merged updater; all comments
    and layout come from the new (template) file so output matches the new file exactly.
    chosen_overrides: optional dict (section, key) -> raw value; these override updater values (user chose [1] old value).
    """
    if chosen_overrides is None:
        chosen_overrides = {}
    try:
        # Build (section, key) -> merged raw value from the updater
        merged_value_map = {}
        for section in updater.sections():
            for key in updater[section].keys():
                try:
                    parts = get_value_parts(updater[section][key].value)
                    merged_value_map[(section, key)] = parts['raw_value']
                except Exception:
                    pass
        # Apply user's explicit choices so they are always written (ConfigUpdater may not persist in-memory changes)
        merged_value_map.update(chosen_overrides)

        with open(new_config_path, 'r') as f:
            new_config_lines = f.readlines()

        output_lines = []
        current_section = None

        for i, line in enumerate(new_config_lines):
            line_stripped = line.strip()
            sec = parse_section_header(line)
            if sec is not None:
                current_section = sec
                output_lines.append(line)
            elif ':' in line and not line_stripped.startswith('#'):
                key = line.split(':', 1)[0].strip()
                # ConfigUpdater normalizes option names (e.g. lowercases); use same for lookup
                lookup_key = updater.optionxform(key) if hasattr(updater, 'optionxform') else key
                # Multiline value = next non-blank line is indented (continuation). Blank lines alone are not multiline.
                j = i + 1
                while j < len(new_config_lines) and new_config_lines[j].strip() == '':
                    j += 1
                next_nonblank = new_config_lines[j] if j < len(new_config_lines) else ''
                is_multiline_key = next_nonblank and next_nonblank[0] in ' \t'
                if is_multiline_key or not current_section or (current_section, lookup_key) not in merged_value_map:
                    output_lines.append(line)
                else:
                    # Replace value with merged value; keep comment at same column as in template
                    right_side = line.split(':', 1)[1]
                    merged_val = merged_value_map[(current_section, lookup_key)]
                    if '#' in right_side:
                        idx = right_side.index('#')
                        rest_before_hash = right_side[:idx]
                        inline_comment = right_side[idx:]
                        stripped = rest_before_hash.strip()
                        padding_before = rest_before_hash[:rest_before_hash.find(stripped)] if stripped else rest_before_hash
                        # Pad so # stays at template column (merged value length may differ, e.g. True vs False)
                        target_len_before_hash = len(rest_before_hash)
                        padding_after_len = max(0, target_len_before_hash - len(padding_before) - len(merged_val))
                        new_line = key + ':' + padding_before + merged_val + (' ' * padding_after_len) + inline_comment
                    else:
                        new_line = key + ': ' + merged_val + '\n'
                    if not new_line.endswith('\n'):
                        new_line += '\n'
                    output_lines.append(new_line)
            else:
                output_lines.append(line)

        with open(file_path, 'w') as f:
            f.writelines(output_lines)

        print(f"Configuration saved to {file_path} with preserved comment structure")
        
    except Exception as e:
        print(f"Error saving configuration with preserved comments: {e}")
        # Fallback to regular save
        save_config(updater, file_path)


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
def compare_and_merge_configs(old_config, new_config, output_path, new_config_path, old_config_path: str):
    chosen_blocks = {}  # (section, key) -> list of lines (for multi-line options we couldn't set via ConfigUpdater)
    chosen_sections = {}  # section_name -> lines (for demon_custom_expansion: whole macro section)
    chosen_overrides = {}  # (section, key) -> raw value when user chose [1] old value (so save uses it regardless of updater)
    expansion_macro_section_names = set()

    new_base = get_base_filename(os.path.basename(new_config_path))
    if new_base == DEMON_CUSTOM_EXPANSION_BASE:
        old_sections = parse_file_into_macro_sections(old_config_path)
        new_sections = parse_file_into_macro_sections(new_config_path)
        old_by_name = {name: lines for name, lines in old_sections if name is not None}
        new_by_name = {name: lines for name, lines in new_sections if name is not None}
        for section_name in new_by_name:
            if not is_expansion_macro_section(section_name):
                continue
            expansion_macro_section_names.add(section_name)
            if section_name not in old_by_name:
                continue
            old_lines = old_by_name[section_name]
            new_lines = new_by_name[section_name]
            if old_lines == new_lines:
                continue
            chosen_sections[section_name] = show_section_diff_and_choose(old_lines, new_lines, section_name)

    console.rule(f":exclamation: Informations :exclamation:")
    print(f":grey_exclamation: [blue]Old value[1] is the value from your config backup at {OLD_CONFIG_PATH}")
    print(f":grey_exclamation: [green]New value[1] is the value from the new config template already copied at {NEW_CONFIG_PATH}\n")

    for section in new_config.sections():
        if new_base == DEMON_CUSTOM_EXPANSION_BASE and section in expansion_macro_section_names:
            continue
        for key, item in new_config[section].items():
            # Find this key in the old config (any section); handles reorganized/split sections between versions
            old_section = find_section_for_key(old_config, key)
            if old_section is None:
                continue
            if key == 'variable_demon_version':
                continue
            try:
                old_value = get_value_parts(old_config[old_section][key].value)
                new_value = get_value_parts(new_config[section][key].value)
            except Exception:
                # ConfigUpdater can't handle this option (e.g. multi-line value); use raw file blocks
                old_block = get_option_block_range_and_lines(old_config_path, old_section, key)
                new_block = get_option_block_range_and_lines(new_config_path, section, key)
                if old_block and new_block:
                    _, _, old_lines = old_block
                    _, _, new_lines = new_block
                    chosen = show_multiline_diff_and_choose(old_lines, new_lines, section, key)
                    chosen_blocks[(section, key)] = chosen
                continue
            if old_value['raw_value'] == new_value['raw_value']:
                continue
            # Single-line: prompt and possibly assign
            console.rule(f"Section: [yellow]\[{section}][/], key: [purple]{key}[/]")
            print(f"[green]{new_value['comment']}[/]")
            print(f"[blue]\[1][/] Old value: [blue]{old_value['raw_value']}[/]")
            print(f"[green1]\[2][/] New value: [green1]{new_value['raw_value']}[/]")
            choice = Prompt.ask(
                "Which value do you want to keep? [blue]\[1][/] or [green1]\[2][/] or [red][q][/] to cancel and quit: ",
                choices=["1", "2", "q"],
                default="2",
            )
            if choice == 'q':
                print(f"[red]Operation Cancelled, no file was written![/]\n")
                sys.exit(0)
            if choice == '1':
                print(f"[blue]Old value[/] kept!\n")
                chosen_overrides[(section, key)] = old_value['raw_value']
                try:
                    new_config[section][key].value = old_value['raw_value']
                except Exception:
                    # Assign failed (e.g. multi-line); fall back to block choice
                    old_block = get_option_block_range_and_lines(old_config_path, old_section, key)
                    new_block = get_option_block_range_and_lines(new_config_path, section, key)
                    if old_block and new_block:
                        _, _, old_lines = old_block
                        _, _, new_lines = new_block
                        chosen = show_multiline_diff_and_choose(old_lines, new_lines, section, key)
                        chosen_blocks[(section, key)] = chosen

            elif choice == '2':
                print(f"[green1]New value[/] kept!\n")

    # Save the merged configuration
    console.rule(f"Save config")
    choice = Prompt.ask(
        f"Do you want to overwrite [purple]\"{output_path}\"[/]? ",
        choices=["y", "n", "q"],
        default="y",
    )
    if choice == 'n':
        output_path = ask_file_path()
    elif choice == 'q':
        print(f"[red]Operation Cancelled, no file was written![/]\n")
        sys.exit(0)

    preserve_comments_and_save_config(new_config, output_path, new_config_path, chosen_overrides)
    patch_multi_line_blocks(output_path, chosen_blocks)
    if chosen_sections:
        patch_macro_sections(output_path, chosen_sections)
    print(f"Merged configuration saved to [purple]\"{output_path}\"[/]\n")
    console.rule(f"")


def process_config_update_core(old_config_path: str, new_config_path: str, output_path: str, interactive_mode: bool = True) -> bool:
    """Core function to process config update. Returns True if successful, False otherwise.
    
    Args:
        old_config_path: Path to the old config file
        new_config_path: Path to the new config file  
        output_path: Path for the output file
        interactive_mode: If True, prompt user for choices. If False, use old values by default.
    """
    
    # Ensure both configuration files exist
    if not os.path.exists(old_config_path):
        console.print(f"[red]Error:[/] Old config file does not exist: {old_config_path}")
        return False
    
    if not os.path.exists(new_config_path):
        console.print(f"[red]Error:[/] New config file does not exist: {new_config_path}")
        return False
    
    # Load configurations
    try:
        old_config = load_config(old_config_path)
        new_config = load_config(new_config_path)
    except Exception as e:
        console.print(f"[red]Error loading config files:[/] {str(e)}")
        return False
    
    if interactive_mode:
        try:
            compare_and_merge_configs(
                old_config, new_config, output_path, new_config_path, old_config_path
            )
            return True
        except Exception as e:
            console.print(f"[red]Error during config merge:[/] {str(e)}")
            return False
    else:
        # Direct mode: automatically use old values; multi-line options go to chosen_blocks and get patched
        console.print("[yellow]Direct mode: Using old values by default to preserve user settings.[/]")
        chosen_blocks = {}
        chosen_sections = {}
        expansion_macro_section_names = set()
        new_base = get_base_filename(os.path.basename(new_config_path))
        if new_base == DEMON_CUSTOM_EXPANSION_BASE:
            old_sections = parse_file_into_macro_sections(old_config_path)
            new_sections = parse_file_into_macro_sections(new_config_path)
            old_by_name = {name: lines for name, lines in old_sections if name is not None}
            new_by_name = {name: lines for name, lines in new_sections if name is not None}
            for section_name in new_by_name:
                if not is_expansion_macro_section(section_name) or section_name not in old_by_name:
                    continue
                expansion_macro_section_names.add(section_name)
                chosen_sections[section_name] = list(old_by_name[section_name])
        for section in new_config.sections():
            if new_base == DEMON_CUSTOM_EXPANSION_BASE and section in expansion_macro_section_names:
                continue
            for key, item in new_config[section].items():
                old_section = find_section_for_key(old_config, key)
                if old_section is None:
                    continue
                if key == 'variable_demon_version':
                    continue
                try:
                    old_value = get_value_parts(old_config[old_section][key].value)
                    new_value = get_value_parts(new_config[section][key].value)
                except Exception:
                    old_block = get_option_block_range_and_lines(old_config_path, old_section, key)
                    if old_block:
                        _, _, old_lines = old_block
                        chosen_blocks[(section, key)] = list(old_lines)
                    continue
                if old_value['raw_value'] != new_value['raw_value']:
                    try:
                        new_config[section][key].value = old_value['raw_value']
                        console.print(f"[blue]Preserved old value for[/] [{section}] {key}")
                    except Exception:
                        old_block = get_option_block_range_and_lines(old_config_path, old_section, key)
                        if old_block:
                            _, _, old_lines = old_block
                            chosen_blocks[(section, key)] = list(old_lines)
        try:
            if chosen_sections:
                preserve_comments_and_save_config(new_config, output_path, new_config_path)
            else:
                save_config(new_config, output_path)
            patch_multi_line_blocks(output_path, chosen_blocks)
            if chosen_sections:
                patch_macro_sections(output_path, chosen_sections)
            console.print(f"[green]Configuration saved to: {output_path}[/]")
            return True
        except Exception as e:
            console.print(f"[red]Error saving config:[/] {str(e)}")
            return False


# Process a single config file update
def process_config_update(target_config_file: str) -> bool:
    """Process a single config file update. Returns True if successful, False otherwise."""
    
    old_config_path, new_config_path = find_config_files(target_config_file)

    if not new_config_path:
        console.print("[red]Error:[/] Unable to proceed without target config file.")
        return False

    # Ensure new configuration exists
    if not os.path.exists(new_config_path):
        console.print(f"[red]Error:[/] {new_config_path} does not exist.")
        return False

    # If no old config found, ask user if they want to continue with defaults
    if not old_config_path:
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

    # Use the core function in interactive mode
    return process_config_update_core(old_config_path, new_config_path, new_config_path, interactive_mode=True)


def print_restart_klipper_reminder():
    """Print a reminder that Klipper must be restarted after config changes."""
    console.print()
    console.print("[yellow]Klipper must be restarted for config changes to take effect.[/]")
    console.print("[dim]Restart command: [green1][bold]sudo systemctl restart klipper[/][/][/]")
    console.print()


# Main function with loop for multiple config updates
def main():
    args = parse_arguments()
    
    console.rule("[bold blue]Demon Config Update Tool[/]")
    console.print("[green]Welcome to the Demon Config Update Tool![/]")
    console.print("This tool helps you merge settings from previous config versions into new ones.\n")
    console.print("[yellow]Tip:[/] Use --help to see command-line options.\n")
    # Check if we're in command-line mode
    if args.old_config and args.new_config:
        # Command-line mode: process files directly without listing the regular files and menu
        if not validate_file_paths(args):
            console.print("[red]Exiting due to validation errors.[/]")
            sys.exit(1)
        
        console.rule("[bold blue]Demon Config Update Tool - Direct Mode[/]")
        console.print("[green]Processing files directly based on command-line arguments.[/]\n")
        
        # Set output path
        output_path = args.output if args.output else args.new_config
        
        # Process the files directly
        success = process_config_update_core(args.old_config, args.new_config, output_path, interactive_mode=True)
        
        if success:
            console.print(f"[green]✓ Successfully processed config files[/]")
            console.print(f"[green]Output saved to: {output_path}[/]")
            print_restart_klipper_reminder()
        else:
            console.print(f"[red]✗ Failed to process config files[/]")
            sys.exit(1)
        
        console.rule("[blue]Direct Mode Complete[/]")
        return
    
    # Show help if only one config file is specified
    if bool(args.old_config) != bool(args.new_config):
        console.print("[red]Error:[/] Both --old-config and --new-config must be specified together.")
        console.print("Use --help for usage information.")
        sys.exit(1)
    
    # Interactive mode
    any_file_written = False

    while True:
        # Select config file to update
        target_config = select_config_file()

        if target_config is None:
            console.print("[yellow]No config file selected. Exiting.[/]")
            break

        # Process the selected config
        success = process_config_update(target_config)
        if success:
            any_file_written = True
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

    if any_file_written:
        print_restart_klipper_reminder()
    console.rule("[blue]Session Complete[/]")


if __name__ == "__main__":
    main()