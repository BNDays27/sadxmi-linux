#!/bin/sh
name="SADX Mod Installer"
icon_path="./samm.png"

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

echo "entering setup"
yad --width=750 --height=100 --info --title="$name Installation" --window-icon="$icon_path" --image="$icon_path" --text="Please select the directory where Sonic Adventure DX is installed" --button="OK:1" --button="Cancel:0"
  if [ $? -eq 0 ]; then
  echo "Script exited by user"
  exit 0
fi

selected_folder=$(zenity --file-selection --directory --title "select the directory where Sonic Adventure DX is installed, no symlinks")

if [ -f "$selected_folder/Sonic Adventure DX.exe" ]; then

$( curl https://dcmods.unreliable.network/owncloud/data/PiKeyAr/files/Setup/sadx_setup.exe --output "$selected_folder/sadx_setup.exe"
 protontricks-launch --appid 71250 "$selected_folder/sadx_setup.exe"

 if [[ -f $selected_folder/SAModManager.exe ]]; then echo "SA Mod Manager has been installed"; 


 else
    echo "SADX Mod Manager hasn' been installed"
    exit 0
 fi

 echo "[Desktop Entry]
Exec=protontricks-launch --appid 213610  '$selected_folder/SAModManager.exe' %u
GenericName=A new mod manager for the Sonic Adventure games.
Icon=samm
Categories=Game;
MimeType=x-scheme-handler/sadxmm;x-scheme-handler/sa2mm
Name=Sonic Adventure Mod Manager
StartupNotify=true
Terminal=false">> $XDG_DATA_HOME/applications/samm.desktop

install -Dm644 ./samm.png 
)

else

echo "no folder selected, exiting script"
exit 0
fi
