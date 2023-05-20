#!/bin/bash
### _================
### __fail2ban
### _================

alias fail2ban-client='sudo fail2ban-client '
f2b(){
    case $1 in
    jail)
        sudo $EDITOR /etc/fail2ban/$1.d/$2.local;;
    filter|action)
        sudo $EDITOR /etc/fail2ban/$1.d/$2.conf;;
    j)
        sudo $EDITOR /etc/fail2ban/jail.local;;
    config)
        sudo $EDITOR /etc/fail2ban/fail2ban.local;;
    s)
        fail2ban-client status $2;;
    r)
        fail2ban-client reload $2;;
    rr)
        systemctl restart fail2ban;;
    p)
        fail2ban-client ping;;
    logs)
        sudo tail -f /var/log/fail2ban/fail2ban.log;;
    service)
        sudo $EDITOR /etc/systemd/system/fail2ban.service.d/override.conf;
        systemctl daemon-reload;
        ;;
    *)
        fail2ban-client $@;;
    esac
}
jails(){
    local JAILS=`fail2ban-client status | grep "Jail list" | sed -E 's/^[^:]+:[ \t]+//' | sed 's/,//g'`
    for JAIL in $JAILS
        do
        fail2ban-client status $JAIL;
        new-line;
    done
}
