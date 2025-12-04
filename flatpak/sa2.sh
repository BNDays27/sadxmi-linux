#!/bin/sh
echo "Entering SA2 setup"
sa2_selected_folder=$(zenity --file-selection --directory --title "select the directory where Sonic Adventure 2 is installed")

if [[ -f "$sa2_selected_folder/sonic2app.exe" ]]; then 
   echo "sonic2app.exe detected, installing SA Mod Manager"
else
   echo "The folder doesn't contain sonic2app.exe, please run the script again and select the correct directory"
   exit 0
fi
#  Downloads the selected version of .NET 8, not sure if there is a way to download the latest version of it so thats why it's like this
curl -Lo "$sa2_selected_folder/dotnet-runtime.exe" https://builds.dotnet.microsoft.com/dotnet/WindowsDesktop/8.0.22/windowsdesktop-runtime-8.0.22-win-x64.exe
flatpak run --command=protontricks-launch com.github.Matoking.protontricks --appid 213610 "$sa2_selected_folder/dotnet-runtime.exe" /passive

#  installs the latest version of the Sonic Adventure Mod Manager
curl -JLo "$sa2_selected_folder/samm.zip" https://github.com/X-Hax/SA-Mod-Manager/releases/latest/download/release_x64.zip
unzip "$sa2_selected_folder/samm.zip" -d "$sa2_selected_folder"
flatpak run --command=protontricks-launch com.github.Matoking.protontricks --appid 213610 "$sa2_selected_folder/SAModManager.exe"

#  makes samm.desktop if it doesnt exist already for whatever reason
if [ ! -f "$desktop_files/samm.desktop" ]; then
   desktop-file-install --dir="$desktop_files" "$SCRIPT_DIR/samm.desktop"
   echo "Exec=protontricks-launch --appid 213610 '$sa2_selected_folder/SAModManager.exe' %U" >> "$desktop_files/samm.desktop"
   update-desktop-database "$desktop_files"

# Installs the icon file and deletes the installer and other files
   install -Dm644 "$icon_path" "$icon_files/samm.png"
else
   echo "samm.desktop already exists, exiting setup"
fi

rm "$sa2_selected_folder/samm.zip"
rm "$sa2_selected_folder/dotnet-runtime.exe"
