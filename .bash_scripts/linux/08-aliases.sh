#!/bin/bash
### _================
### __Basic Linux alias utils
### _================

alias USERS="awk -F':' '{ print \$1}' /etc/passwd"

### _(Drives)
### _================
alias LOCK='chmod -R 775 ' #_(set read only on /<directory>|<file>)
alias UNLOCK='chmod -R 777 ' #_(allow read and write on /<directory>|<file>)
alias NOBODY='chown 65534:65534 ' #_(change ownership to nobody)
### _(Statuses)
### _================
alias system-time="new-line; timedatectl show --value --p Timezone --p TimeUSec" #_(system time)
alias ip-address='new-line; ip -o -f inet address | cut -d " " -f 2,7' #_(your ip addresses)
alias net-stat='ip link ls up' #_(network status)
alias cpu-stat='new-line; mpstat -P ALL' #_(cpu stats)
alias core-temp='new-line; sensors | grep "Core\|cpu\|temp"' #_(cpu core temps)
alias journal-lookup='journalctl -xe -f | grep '
### _(Peripherals)
### _================
alias audio-threads='fuser -v /dev/snd/*' #_(audio threads)
