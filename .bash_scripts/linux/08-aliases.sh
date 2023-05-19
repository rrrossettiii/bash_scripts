#!/bin/bash
### _================
### __basic linux alias utils
### _================

### __user
### _================
alias USERS="awk -F':' '{ print \$1}' /etc/passwd" ### list all users

### __desktop environment
### _================
alias desktop='systemctl start $DESKTOP_SERVICE' ### start desktop
alias desktop-on='systemctl enable $DESKTOP_SERVICE; desktop' ### enable on boot & start
alias desktop-off='systemctl disable $DESKTOP_SERVICE' ### disable on boot

### __drives
### _================
alias LOCK='chmod -R 775 ' ### set read only on /<directory>||<file>
alias UNLOCK='chmod -R 777 ' ### allow read and write on /<directory>||<file>
alias NOBODY='chown 65534:65534 ' ### change ownership to `nobody`
### __statuses
### _================
alias system-time="new-line; timedatectl show --value --p Timezone --p TimeUSec" ### system time
alias ip-address='new-line; ip -o -f inet address | cut -d " " -f 2,7' ### your ip addresses
alias net-stat='ip link ls up' ### network status
alias cpu-stat='new-line; mpstat -P ALL' ### cpu stats
alias core-temp='new-line; sensors | grep "Core\|cpu\|temp"' ### cpu core temps
alias jgrep='journalctl -xe -f | grep ' ### grep the journal
### __peripherals
### _================
alias audio-threads='fuser -v /dev/snd/*' ### audio threads
