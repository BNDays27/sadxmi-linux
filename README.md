# SADX Mod installer for Linux
A bash script that makes it easier to Install the SADX mod installer and use the Sonic Adventure Mod Manager on Linux

## Dependencies
The scipt requires these dependencies
```
yad
zenity
protontricks
```
### Arch/Arch based distros
you can install all of these through your AUR helper or manually
```
sudo pacman -S protontricks yad zenity
yay -S protontricks-git
```

# Installation
```
git clone https://github.com/BNDays27/sadxmi-linux
cd sadxmi-linux
./setup-linux.sh
