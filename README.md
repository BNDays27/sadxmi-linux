<h1>
	<img width="48" align="left" src="https://github.com/BNDays27/sadxmi-linux/blob/main/samm.png?raw=true">
	</a>
	SADX Mod installer for Linux
</h1>
A Bash script that makes it easier to Install the SADX mod installer and use the Sonic Adventure Mod Manager on Linux

> [!IMPORTANT]
> The script requires you to have [the Steam version of Sonic Adventure DX](https://store.steampowered.com/app/71250/Sonic_Adventure_DX/), please install it before using the script.
# Contents
- [Dependencies](#dependencies)
- [Installation](#installation)

## Dependencies
The scipt requires these dependencies
```
zenity
protontricks
```
### Arch/Arch based distros
You can install all of these through your AUR helper or manually
```
yay -S protontricks zenity
```

### Other non-immutable Distros
[Please refer to this part of the Protontricks GitHub page](https://github.com/Matoking/protontricks?tab=readme-ov-file#pipx)


### SteamOS/Bazzite/other immutable distros
SteamOS Already provides Zenity by default, so all you need to install is Protontricks, you can do so by installing it through a software manager that uses Flathub like KDE Discover or by typing this into your terminal
```
flatpak install flathub com.github.Matoking.protontricks
```

## Installation

### non-immutable Linux distros
If youve installed Protontricks natively, use the `setup-linux.sh` script
```
git clone https://github.com/BNDays27/sadxmi-linux
cd sadxmi-linux
./setup-linux.sh
```
### SteamOS/Bazzite/other imuutable Linux distros
If youve installed Protontricks through the flatpak or are on SteamOS, please use the `setup-immutable.sh` script
```
git clone https://github.com/BNDays27/sadxmi-linux
cd sadxmi-linux
./setup-immutable.sh
```
