<h1>
	<img width="48" align="left" src="https://github.com/BNDays27/sadxmi-linux/blob/main/samm.png?raw=true">
	</a>
	SADX Mod installer for Linux
</h1>
A Bash script that makes it easier to Install the SADX mod installer and use the Sonic Adventure Mod Manager on Linux

# Contents
- [Dependencies](#dependencies)
- [Installation](#installation)
- [Bugs/Issue Reporting](#bugsissue-reporting)
> [!IMPORTANT]
> The script requires you to have the Steam version of [Sonic Adventure DX](https://store.steampowered.com/app/71250/Sonic_Adventure_DX/) or [Sonic Adventure 2](https://store.steampowered.com/app/213610/Sonic_Adventure_2/) installed, if you dont own or it or have it, please purchase or install it before using the script.

## Dependencies
both scripts require these dependencies
```
zenity
protontricks
unzip
```
### Arch/Arch based distros
You can install zenity and unzip through the `extra` repo, whilst protontricks is (as of now) only in the AUR, so you will have to install it through your AUR helper or manually from 
[the AUR website](https://aur.archlinux.org/packages/protontricks)
```
sudo pacman -S zenity unzip
paru -S protontricks-git
```

### Fedora / Fedora based Distros
You can install protontricks, unzip zenity directly from DNF                                

```
sudo dnf install protontricks zenity unzip
```

### Other non-immutable Distros
to install protontricks, [Please refer to this part of the Protontricks GitHub page](https://github.com/Matoking/protontricks?tab=readme-ov-file#pipx) to install protontricks via pipx. If you want to, you can install 
protontricks via flathub and use the `setup-immutable` script instead

### SteamOS/Bazzite/other immutable distros
both SteamOS and Bazzite Already provide Zenity, so all you need to install is Protontricks. You can do so by installing it through a software manager that uses Flathub like KDE Discover or by typing this into Konsole
```
flatpak install flathub com.github.Matoking.protontricks
```

## Installation

### non-immutable Linux distros
If youve installed Protontricks natively or through pip/pipx, clone the repo and use the `setup-linux.sh` script
```
git clone https://github.com/BNDays27/sadxmi-linux
cd sadxmi-linux
./setup-linux.sh
```
### SteamOS/Bazzite/other immutable Linux distros
If you've installed Protontricks through the flatpak or are on SteamOS, clone the repo and use the `setup-immutable.sh` script
```
git clone https://github.com/BNDays27/sadxmi-linux
cd sadxmi-linux
./setup-immutable.sh
```
If you want to set up mod support for Sonic Adventure 2, please select yes when questioned

## Bugs/Issue Reporting
If you have any bugs, please go and [report an issue](https://github.com/BNDays27/sadxmi-linux/issues), I'll try and get to you as soon as I can.

# Thanks!
Thanks for using this, I don't really have much to say but I really do appreciate you using my script. Thanks!
