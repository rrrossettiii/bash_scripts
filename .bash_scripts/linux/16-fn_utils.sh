#!/bin/bash
### _================
# ~/.bash_scripts/linux/16-fn_utils.sh
### _================

### bash
### _================
sync-bash-root(){
	sudo cp /home/$ADMIN/.bashrc /root/; ### sync .bashrc w/ /root/
	sudo cp -r /home/$ADMIN/.bash_scripts /root/; ### sync .bash_scripts w/ /root/
	rbrc; ### reload .bashrc
}
### cpu-usage
### _================
cpu-usage(){
    grep 'cpu ' /proc/stat |
    awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage}' |
    awk '{printf("%.1f%\n", $1)}'
}
### services [systemd]
### _================
services(){ ### show active services
	local PARAMS=(
		list-units
		--type=service
		--state=running
		--no-pager
		--quiet
	)
	new-line;
	if [ "$1" == 'user' ];
		then systemctl --user "${PARAMS[@]}" | grep active;
		else sudo systemctl "${PARAMS[@]}" | grep active;
	fi
}
### statuses
### _================
whatsup(){ ### nuff said
    label '~You~' CYAN;
    who;
    label '~CPU~' GREEN;
    cpu-stat;
    core-temp;
    label '~Drives~' MAGENTA;
    freespace;
    smart-status;
    label '~Firewall~' RED;
    firewall;
    label '~Fail2Ban~' MAGENTA;
    jails;
    label '~System~' YELLOW;
    system-time;
    ip-address;
    services;
    services user;
    label '~Docker~' BLUE;
    crew;
    label '~Tasks~' RED;
    processes;
}
