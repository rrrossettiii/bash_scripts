#!/bin/bash
### _================
### __Arch specific util functions
### _================

### _Installed packages
### _================
packages(){
	pacman -Qei | awk '/^Name/ { name=$3 } /^Groups/ { if ( $3 != "base" && $3 != "base-devel" ) { print name } }'
}

### _Unused Dependencies
### _================
### -- $1 == "prune"
dependencies(){
	local DEPENDENCIES=$(pacman -Qdtq)
	if [ "$1" == 'prune' ]; then
		pacman -Rsn $DEPENDENCIES; #_(prune unused dependencies)
	else
		printf "$DEPENDENCIES"; #_(print unused dependencies)
	fi
}
