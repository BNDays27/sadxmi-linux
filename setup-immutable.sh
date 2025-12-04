#!/bin/sh
name="SADX Mod Installer"
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
icon_path="$SCRIPT_DIR/samm.png"
desktop_files=${XDG_DATA_HOME:-$HOME/.local/share}/applications
icon_files=${XDG_DATA_HOME:-$HOME/.local/share}/icons/hicolor/256x256/apps

# checks to see if all of the dependencies are installed
check_command_exists() {
  appid="${*}"
if ! flatpak info "$appid" >/dev/null 2>&1; then
    echo "$appid isnt installed, please install the flatpak before continuing, if you have the native version, please use the setup-linux script"
    exit 1
    fi
}

check_command_exists com.github.Matoking.protontricks
selector=$(zenity --list --column=Game --column=Description --title "Select a Game" "Sonic Adventure DX" "Downloads the SADX mod installer for Sonic Adventure DX" "Sonic Adventure 2" "Adds mod support for Sonic Adventure 2" --width 720 --height 100)

echo "$selector selected"

if [[ $selector == "Sonic Adventure DX" ]]; then
  . $SCRIPT_DIR/flatpak/sadx.sh

elif [[ $selector == "Sonic Adventure 2" ]]; then
  . $SCRIPT_DIR/flatpak/sa2.sh

else
  exit 0
fi
