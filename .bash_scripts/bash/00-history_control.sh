#!/bin/bash
### _================
### __History
### _================
alias bash-cc-hist='history -c && history -w;' #_(delete all bash history)

export HISTCONTROL=erasedups
export HISTIGNORE=ls:history:exit
export HISTFILESIZE=10000
export HISTSIZE=1000
shopt -s histappend
shopt -s cmdhist


if [[ -z $LOADED_HISTORY ]];then #_(prevent += each time you reload .bashrc)
	export LOADED_HISTORY=1;
	### _(History Options)
	### _================
	PROMPT_COMMAND=(
	'history -a' #_(append)
	'history -n' #_(new lines)
	'history -w' #_(write)
	'history -c' #_(clear)
	'history -r' #_(reload)
)
fi
