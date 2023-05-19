#!/bin/bash
### _================
### __arch setup
### _================

### _bootstrap
### _================
setup-archlinux(){ ### comment out what you dont need
# 	sudo \
	pacman -Syu \
		base-devel \
		nano \
		sudo \
		progress \
		clamav \
		sysstat \
		smartmontools \
		inetutils \
		docker \
		docker-compose \
		git;
	### install yay
	cd $GITHUB; git clone https://aur.archlinux.org/yay.git; cd yay; makepkg -si;
}

### _upgrade util
### _================
arch-upgrade(){
	pacman -Syu; ### system updates
	[[ -n $(pacman -Qi | grep yay) ]] && yay-upgrade; ### yay updates
	# [[ -n $(pacman -Qi | grep docker-compose) ]] && port; ### docker-compose updates
	# [[ -n $(pacman -Qi | grep docker-compose) ]] && fleet port; ### docker-compose 'fleet' updates
    # reboot;
}
