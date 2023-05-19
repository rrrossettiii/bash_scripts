#!/bin/bash
### _================
### __arch specific util functions
### _================

### __installed packages
### _================
packages(){
	pacman -Qei | awk '/^Name/ { name=$3 } /^Groups/ { if ( $3 != "base" && $3 != "base-devel" ) { print name } }'
}

### __unused dependencies
### _================
### $1 == "prune"
dependencies(){
	local DEPENDENCIES=$(pacman -Qdtq)
	if [ "$1" == 'prune' ]; then
		pacman -Rsn $DEPENDENCIES; ### prune unused dependencies
	else
		printf "$DEPENDENCIES"; ### print unused dependencies
	fi
}
