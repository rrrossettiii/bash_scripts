#!/bin/bash
### _================
### __history control
### _================
alias bash-cc-hist='history -c && history -w;' ### delete all bash history

export HISTCONTROL=erasedups
export HISTIGNORE=ls:history:exit
export HISTFILESIZE=10000
export HISTSIZE=1000
shopt -s histappend
shopt -s cmdhist


if [[ -z $LOADED_HISTORY ]];then ### prevent += each time you reload .bashrc
	export LOADED_HISTORY=1;
	### __history options
	### _================
	PROMPT_COMMAND=(
	'history -a' ### append
	'history -n' ### new lines
	'history -w' ### write
	'history -c' ### clear
	'history -r' ### reload
)
fi
