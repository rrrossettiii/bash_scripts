#!/bin/bash
### _================
# ~/.bashrc
### _================

### If not running interactively, don't do anything
[[ $- != *i* ]] && return

### Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

### _================
### __BASH_SCRIPTS [last]
### _================
source ~/.bash_env #_(loads .bash_env variables)
source ~/.bash_scripts/init.sh #_(loads all bash_scripts)