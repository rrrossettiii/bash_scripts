###
### - nginx
###
ngx(){
    case $1 in
        link)
            sudo ln -s /etc/nginx/sites-available/$2.conf /etc/nginx/sites-enabled/$2.conf;;
        unlink)
            sudo unlink /etc/nginx/sites-enabled/$2.conf;;
        e)
            sudo $EDITOR /etc/nginx/nginx.conf;;
        edit);&
        create)
            sudo $EDITOR /etc/nginx/sites-available/$2.conf;;
        conf)
            sudo $EDITOR /etc/nginx/conf.d/$2.conf;;
        r)
            sudo systemctl reload nginx;;
        stop)
            sudo systemctl stop nginx;;
        access)
            sudo tail -f /var/log/nginx/access.log;;
        error)
            sudo tail -f /var/log/nginx/error.log;;
        *)
            systemctl status nginx;;
    esac
}
