#!/bin/sh
name="SADX Mod Installer"
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
icon_path="$SCRIPT_DIR/samm.png"
desktop_files=${XDG_DATA_HOME:-$HOME/.local/share}/applications
icon_files=${XDG_DATA_HOME:-$HOME/.local/share}/icons/hicolor/256x256/apps

# checks to see if all of the dependencies are installed
check_command_exists() {
  command_name="${*}"
  if ! command -v "$command_name" >/dev/null 2>&1; then
    echo "Error: Dependency '$command_name' is not met."
    echo "Exiting.."
    exit 1
  fi
}
check_command_exists protontricks
check_command_exists curl
check_command_exists zenity
check_command_exists unzip

# if you want to go to the SADX setup file go to ./linux/sadx.sh
. $SCRIPT_DIR/linux/sadx.sh
zenity --question --title "Extras" --text "Do you want to set up mods for the steam version of Sonic Adventure 2" --icon $icon_path

# if you want to go to the SA2/2B setup file go to ./linux/sa2.sh
if [[ $? == 0 ]]; then
. $SCRIPT_DIR/linux/sa2.sh
fi
