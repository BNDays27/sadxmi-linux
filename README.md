<h1>
	<img width="48" align="left" src="https://github.com/BNDays27/salms/blob/main/samm.png?raw=true">
	</a>
	Sonic Adventure Linux Modding Script (SALMS)
</h1>

A Linux shell script that makes it easier to Setup mods for Both [Sonic Adventure DX](https://store.steampowered.com/app/71250/Sonic_Adventure_DX/) and [Sonic Adventure 2](https://store.steampowered.com/app/213610/Sonic_Adventure_2/) on Linux

# Contents
- [Dependencies](#dependencies)
- [Installation](#installation)
- [Bugs/Issue Reporting](#bugsissue-reporting)

> [!IMPORTANT]
> This script requires you to either have the Steam version of [Sonic Adventure DX](https://store.steampowered.com/app/71250/Sonic_Adventure_DX/) or the Steam version of [Sonic Adventure 2.](https://store.steampowered.com/app/213610/Sonic_Adventure_2/) if you dont own or have one of these installed, please purchase or install it before using the script.

## Dependencies
Both scripts require these dependencies
```
zenity
protontricks
unzip
```

### Arch / EndeavourOS / CachyOS / Other Arch based Distros
You can install all of the dependencies through the `extra` repo using `pacman`
``` sh
sudo pacman -S zenity unzip protontricks
```

### Fedora / Fedora based Distros
You can install Protontricks, unzip zenity directly from `dnf`
``` sh
sudo dnf install protontricks zenity unzip
```

### Other non-immutable Distros
To install Protontricks, [Please refer to this part of the Protontricks GitHub page](https://github.com/Matoking/protontricks?tab=readme-ov-file#pipx) to install Protontricks via pipx. If you want to, you can install Protontricks via flathub and use the `setup-immutable` script instead

### SteamOS / Bazzite / other immutable Distros
Both SteamOS and Bazzite Already provide Zenity and unzip by default, so all you need to install is Protontricks. You can do so by installing it through [Flathub](https://flathub.org/en/apps/com.github.Matoking.protontricks) with a software manager like KDE Discover or Bazaar, or by typing this into your terminal of choice
``` sh
flatpak install flathub com.github.Matoking.protontricks
```

## Installation

### non-immutable Linux Distros
If you've installed Protontricks natively or through pip/pipx, clone the repo and use the `setup-linux.sh` script
``` sh
git clone https://github.com/BNDays27/salms
cd salms
./setup-linux.sh
```

### SteamOS/Bazzite/other immutable Linux distros
If you've installed Protontricks through the Flatpak or are on SteamOS, clone the repo and use the `setup-immutable.sh` script
``` sh
git clone https://github.com/BNDays27/salms
cd salms
./setup-immutable.sh
```

## Bugs/Issue Reporting
If you have any bugs, please go and report an issue [in the issues section of the repo](https://github.com/BNDays27/salms/issues), I'll try and get to you as soon as I can, I am only human after all

### Thanks!
- All of the contributors to the [Sonic Adventure Mod Manager](https://github.com/X-Hax/SA-Mod-Manager/graphs/contributors)
- [PkR](https://gitlab.com/PiKeyAr): for creating the [SADX Mod Installer](https://gitlab.com/PiKeyAr/sadx-mod-installer/-/wikis/home)
- The authors of the mods featured [in the installer](https://gitlab.com/PiKeyAr/sadx-mod-installer/-/wikis/home)

I **really** couldn't do this without any of these exiting, so you should give them some love, they deserve it

## Licenses

[![GNU GPLv3 Image](https://www.gnu.org/graphics/gplv3-127x51.png)](http://www.gnu.org/licenses/gpl-3.0.en.html)

This project is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
