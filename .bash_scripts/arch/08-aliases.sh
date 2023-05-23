#!/bin/bash
### _================
# ~/.bash_scripts/arch/08-aliases.sh
### _================

### __system
### _================
alias pacman='sudo pacman ' ### run pacman as root, duh!
alias ???='pacman -Qi ' ### is this package installed?
alias pacman-upgrade='pacman -Syu' ### update pacman packages
alias yay-upgrade="sudo -u $ADMIN yay -Syu" ### update yay packages
alias locksmith='pacman -S archlinux-keyring' ### regenerate archlinux keyring
alias plumber='rm -Rf /var/lib/pacman/db.lck' ### flush pacman db
