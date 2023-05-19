###
### -- UFW
###
alias ufw='sudo ufw'
ufwww(){
    case $1 in
    app)
        sudo $EDITOR /etc/ufw/applications.d/$2;
        ufw app update $2;
        ;;&
    after|before)
        sudo $EDITOR /etc/ufw/$1.rules;
        ufw reload;
        ;;&
    s)
        ufw status numbered;;
    d)
        ufw delete $2;;
    r)
        ufw reload;;
    rr)
        systemctl restart ufw;;
    logs)
        journalctl -xeu ufw.service;;
    *)
        ufw status;;
    esac
}
