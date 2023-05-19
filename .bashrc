#!/bin/bash
### _================
# ~/.bashrc
### _================

### If not running interactively, don't do anything
[[ $- != *i* ]] && return
### Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

### _(Directives)
### _================
shopt -s checkwinsize

### _(Editor)
### _================
alias nano='nano -m -u -c -W --tabsize=4 --fill=100 --autoindent'
export EDITOR=nano
export VISUAL=nano

### _================
### __SCRIPTS (last)
### _================
source ~/.bash_env #_(loads .bash_env variables)
source ~/.bash_scripts/init.sh #_(loads all scripts)