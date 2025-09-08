#!/bin/sh
name="SADX Mod Installer"
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
icon_path="$SCRIPT_DIR/samm.png"
desktop_files=${XDG_DATA_HOME:-$HOME/.local/share}/applications
icon_files=${XDG_DATA_HOME:-$HOME/.local/share}/icons/hicolor/256x256/apps

appid=com.github.Matoking.protontricks
if ! flatpak info "$appid" >/dev/null 2>&1; then
    echo "Protontricks isnt installed, please install the flatpak before continuing"
    exit 0
else
    echo "Protontricks is installed."
fi

# this is the actual installer
echo "entering setup"
zenity --width=750 --height=100 --info --title="$name Installation" --text="Please select the directory where Sonic Adventure DX is installed"

selected_folder=$(zenity --file-selection --directory --title "select the directory where Sonic Adventure DX is installed")

if [ -f "$selected_folder/Sonic Adventure DX.exe" ]; then

echo "Sonic Adventure DX.exe detected, downloading and running the SADX Mod Installer"
else

echo "The folder doesn't contain Sonic Adventure DX.exe, please run the script again and select the correct directory"
exit 0
fi

# Downloads and launches the SADX mod installer, the rest of it should be handled by that
 curl https://dcmods.unreliable.network/owncloud/data/PiKeyAr/files/Setup/sadx_setup.exe --output "$selected_folder/sadx_setup.exe"
 flatpak run --command=protontricks-launch com.github.Matoking.protontricks --appid 71250 "$selected_folder/sadx_setup.exe"
 
 # Checks if the mod manager was installed
 if [[ -f $selected_folder/SAModManager.exe ]]; then echo "SA Mod Manager has been installed"; 


 else
    echo "SADX Mod Manager hasn't been installed"
    exit 0
 fi

 curl https://builds.dotnet.microsoft.com/dotnet/WindowsDesktop/8.0.19/windowsdesktop-runtime-8.0.19-win-x64.exe --output "$selected_folder/windowsdesktop-runtime-8.0.19-win-x64.exe"
 flatpak run --command=protontricks-launch com.github.Matoking.protontricks --appid 71250 "$selected_folder/windowsdesktop-runtime-8.0.19-win-x64.exe" /passive
# makes the .desktop entry for 1-click installs and easy opening in whatever application launcher you have
desktop-file-install --dir="$desktop_files" "$SCRIPT_DIR/samm.desktop"
echo "Exec=flatpak run --command=protontricks-launch com.github.Matoking.protontricks --appid 71250 '$selected_folder/SAModManager.exe' %U" >> $desktop_files/samm.desktop
update-desktop-database "$desktop_files"

# Installs the icon file and deletes the installer and other files
install -Dm644 $icon_path $icon_files/samm.png
rm -rf "$selected_folder/instdata"
rm "$selected_folder/sadx_setup.exe"
