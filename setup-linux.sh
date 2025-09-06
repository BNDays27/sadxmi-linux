#!/bin/sh
name="SADX Mod Installer"
icon_path="./samm.png"
desktop_files=${XDG_DATA_HOME:-$HOME/.local/share}/applications
icon_files=${XDG_DATA_HOME:-$HOME/.local/share}/icons/hicolor/256x256/apps

# checks to see if all of the dependencies are installed
if ! command -v protontricks &> /dev/null
then
    echo "Protontricks isn't installed, Please install that through your distro's package manager"
    exit 0
fi

if ! command -v yad &> /dev/null
then
    echo "YAD isn't installed, Please install that through your distro's package manager"
    exit 0
fi

if ! command -v curl &> /dev/null
then
    echo "curl isn't installed, Please install that through your distro's package manager"
    exit 0
fi

if ! command -v zenity &> /dev/null
then
    echo "Zenity isn't installed, Please install that through your distro's package manager"
    exit 0
fi

# this is the actual installer
echo "entering setup"
yad --width=750 --height=100 --info --title="$name Installation" --window-icon="$icon_path" --image="$icon_path" --text="Please select the directory where Sonic Adventure DX is installed" --button="OK:1" --button="Cancel:0"
  if [ $? -eq 0 ]; then
  echo "Script exited by user"
  exit 0
fi

selected_folder=$(zenity --file-selection --directory --title "select the directory where Sonic Adventure DX is installed")

if [ -f "$selected_folder/Sonic Adventure DX.exe" ]; then

echo "Sonic Adventure DX.exe detected, downloading and running the SADX Mod Installer"
else

echo "The folder doesn't Contain Sonic Adventure DX.exe, please run the script again and select the correct directory"
exit 0
fi

# Downloads and launches the SADX mod installer, the rest of it should be handled by that
 curl https://dcmods.unreliable.network/owncloud/data/PiKeyAr/files/Setup/sadx_setup.exe --output "$selected_folder/sadx_setup.exe"
 protontricks-launch --appid 71250 "$selected_folder/sadx_setup.exe"
 
 # Checks if the mod manager was installed
 if [[ -f $selected_folder/SAModManager.exe ]]; then echo "SA Mod Manager has been installed"; 


 else
    echo "SADX Mod Manager hasn' been installed"
    exit 0
 fi

# makes the .desktop entry for 1-click installs and easy opening in whatever application launcher you have
echo "[Desktop Entry]
Exec=protontricks-launch --appid 71250 '$selected_folder/SAModManager.exe' %u
GenericName=A new mod manager for the Sonic Adventure games.
Icon=samm
Categories=Game;
MimeType=x-scheme-handler/sadxmm;x-scheme-handler/sa2mm
Name=Sonic Adventure Mod Manager
StartupNotify=true
Terminal=false">> $desktop_files/samm.desktop

# Installs the icon file and deletes the installer and other files
install -Dm644 $icon_path $icon_files/samm.png
rm -rf "$selected_folder/instdata"
rm "$selected_folder/sadx_setup.exe"
