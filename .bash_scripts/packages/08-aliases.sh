### _================
### - Package specific aliases
### _================

### _(hostname)
alias me='printf "\n$(whoami)\t"; hostname -i' #_(you!)
### _(ufw)
alias firewall='sudo ufw status'
### _(git)
alias git='cd $GITHUB; git ' #_(go to github directory before executing)
### _(libinput)
alias lib-input='libinput list-devices | less' #_(list libinput devices)
### _(xorg)
alias x-input='xinput list | less' #_(list xorg xinput devices)
alias xorg-errors='grep EE /var/log/Xorg.0.log | less'
### _(sshd)
alias sshd-logs='journalctl -t sshd -n 100 | less'
alias sshd-config='sudo $EDITOR /etc/ssh/sshd_config'
### _(progress)
alias prog='progress -m' #_(monitor progress of some bg processes)
