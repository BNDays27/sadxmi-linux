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
selector=$(zenity --list --column=Game --column=Description "Sonic Adventure" "Downloads the SADX mod installer and sets up mods" "Sonic Adventure 2" "Downloads the SA Mod Manager and sets up mods" --width 720 --height 100)

if [[ $selector == "Sonic Adventure" ]]; then
  . $SCRIPT_DIR/linux/sadx.sh

elif [[ $selector == "Sonic Adventure 2" ]]; then
  . $SCRIPT_DIR/linux/sa2.sh

else
  exit 0
fi
