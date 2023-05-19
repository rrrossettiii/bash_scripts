#!/bin/bash
### _================
### __Basic Arch aliases
### _================

### _Desktop Environment
### _================
alias desktop='systemctl start $DESKTOP_SERVICE' # Start Desktop
alias desktop-on='systemctl enable $DESKTOP_SERVICE; desktop' # Enable on boot & Start
alias desktop-off='systemctl disable $DESKTOP_SERVICE' # Disable on boot

### _Upgrade
### _================
alias pacman='sudo pacman ' #_(run pacman as root, duh!)
alias ???='pacman -Qi ' #_(is this package installed?)
alias pacman-upgrade='pacman -Syu' #_(update pacman packages)
alias yay-upgrade="sudo -u $ADMIN yay -Syu" #_(update yay packages)
alias locksmith='pacman -S archlinux-keyring' #_(regenerate archlinux keyring)
alias plumber='rm -Rf /var/lib/pacman/db.lck' #_(flush pacman db)
