### _================
### __package specific aliases
### _================

### hostname
alias me='printf "\n$(whoami)\t"; hostname -i' ### you!
### ufw
alias firewall='sudo ufw status'
### git
alias git='cd $GITHUB; git ' ### go to github /dir before executing
### libinput
alias lib-input='libinput list-devices | less' ### list libinput devices
### xorg
alias x-input='xinput list | less' ### list xorg xinput devices
alias xorg-errors='grep EE /var/log/Xorg.0.log | less'
### sshd
alias sshd-logs='journalctl -t sshd -n 100 | less'
alias sshd-config='sudo $EDITOR /etc/ssh/sshd_config'
### progress
alias prog='progress -m' ### monitor progress of some bg processes
