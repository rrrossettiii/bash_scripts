### _================
### __Alias Utils
### _================

### _(sudo)
### _================
alias sudo='sudo ' #_(enable aliases with sudo)
alias plz='eval sudo $(history -p !!)' #_(rerun last command w/ sudo)
alias vip='sudo su' #_(root mode)
### _(ls)
### _================
alias ls='ls --color=always' #_(list files w/ colors)
alias lsa='ls -aFh' #_(list all & .hidden)
alias lsp='ls -Alh' #_(show permissions)
### _(cd)
### _================
alias ..='cd ..' #_(up 1 /dir)
alias ...='cd ../..' #_(up 2 /dir)
alias ..r='cd /' #_(root /dir)
alias ..p='cd \-' #_(previous /dir)
alias ..h='cd ~' #_(home /dir)
### _(fs)
### _================
alias cp='cp -i' #_(copy interactively)
alias mv='mv -i' #_(move interactively)
alias delete='rm -ivr' #_(remove interactively)
alias mkdir='mkdir -p' #_(create folder and subfolders /parent/child)
alias size='du -hs ' #_(determine file|/dir size)
### -- (.bashrc)
### _================
alias prompt='printf "COMAND_PROMPT=(${PROMPT_COMMAND[*]})\n"'
alias ebrc='$EDITOR ~/.bashrc; rbrc' #_(edit .bashrc)
alias rbrc="source ~/.bashrc; printf 'reloaded .bashrc\n'" #_(reload .bashrc)
### _(Utils)
### _================
alias hup?='tail -f nohup.out' #_(follow nohup.out)
alias fired='kill -9 `jobs -ps`' #_(kill all stopped jobs)
alias ping='ping -c 5' #_(ping only 5 times)
alias wiki='ping wikipedia.org' #_(network test)
alias cc='clear' #_(clear screen)
alias reboot='sudo reboot' #_(sudo)
alias die='shutdown now' #_(r.i.p.)
### _(Messages)
### _================
alias new-line='printf "\n"' #_(print new line)
alias decap='tail -n+2' #_(cut 'decapitate' first line of output)
alias less='less -R' #_(clear screen first)
### _(System)
### _================
alias processes="ps x | awk 'NR == 1 || \$2 ~ /pts/'" #_(list current processes)
alias freespace="new-line; df -h -t $DRIVE_FS" #_(list freespace on System)
alias bus-input='cat /proc/bus/input/devices | less' #_(list native Peripherals)
### _(Extras)
### _================
alias downloads="cd $DOWNLOAD_PATH && ls"
alias beep="printf $RING_BELL"