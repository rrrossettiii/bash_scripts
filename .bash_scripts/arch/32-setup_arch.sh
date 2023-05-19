#!/bin/bash
### _================
### __Necessary packages
### _================

### _Bootstrap
### _================
setup-archlinux(){ #_(comment out what you dont need)
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
	### _(install yay)
	cd $GITHUB; git clone https://aur.archlinux.org/yay.git; cd yay; makepkg -si;
}

### _Upgrade util
### _================
arch-upgrade(){
	pacman -Syu; #_(system updates)
	[[ -n $(pacman -Qi | grep yay) ]] && yay-upgrade; #_(yay updates)
	[[ -n $(pacman -Qi | grep docker-compose) ]] && fleet port; #_(docker "fleet" updates)
    reboot;
}
