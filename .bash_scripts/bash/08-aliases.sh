### _================
### __alias utils
### _================

### __sudo
### _================
alias sudo='sudo ' ### enable aliases with sudo
alias plz='eval sudo $(history -p !!)' ### rerun last command w/ sudo
alias vip='sudo su' ### root mode
### __ls
### _================
alias ls='ls --color=always' ### list files w/ colors
alias lsa='ls -aFh' ### list all & .hidden
alias lsp='ls -Alh' ### show permissions
### __cd
### _================
alias ..='cd ..' ### up 1 /dir
alias ...='cd ../..' ### up 2 /dir
alias ..r='cd /' ### root /dir
alias ..p='cd \-' ### previous /dir
alias ..h='cd ~' ### home /dir
### __fs
### _================
alias cp='cp -i' ### copy interactively
alias mv='mv -i' ### move interactively
alias delete='rm -ivr' ### remove interactively
alias mkdir='mkdir -p' ### create folder and subfolders /parent/child
alias size='du -hs ' ### determine <file>||/<dir> size
### __.bashrc
### _================
alias prompt='printf "COMAND_PROMPT=(${PROMPT_COMMAND[*]})\n"'
alias ebrc='$EDITOR ~/.bashrc; rbrc' ### edit .bashrc
alias rbrc="source ~/.bashrc; printf 'reloaded .bashrc\n'" ### reload .bashrc
### __utils
### _================
alias hup?='tail -f nohup.out' ### follow nohup.out
alias fired='kill -9 `jobs -ps`' ### kill all stopped jobs
alias ping='ping -c 5' ### ping only 5 times
alias wiki='ping wikipedia.org' ### network test
alias cc='clear' ### clear screen
alias reboot='sudo reboot' ### sudo
alias die='shutdown now' ### r.i.p. :(
### __messages
### _================
alias new-line='printf "\n"' ### print new line
alias decap='tail -n+2' ### remove 'decapitate' first line of output
alias less='less -R' ### clear screen first
### __system
### _================
alias processes="ps x | awk 'NR == 1 || \$2 ~ /pts/'" ### list current processes
alias freespace="new-line; df -h" ### list freespace on system
alias bus-input='cat /proc/bus/input/devices | less' ### list native peripherals 
### __extras
### _================
alias downloads="cd $DOWNLOAD_PATH && ls"
alias beep="printf $RING_BELL"