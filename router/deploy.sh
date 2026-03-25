#!/bin/bash

install_file () {
    sudo mv "$1" "$2"
}

install_nginx_conf() {
    sudo mv "$1" "$2"
    sudo ln -fL -v /etc/nginx/sites-available/"$2" /etc/nginx/sites-enabled/"$2"
}

deps () {
    if ! dpkg -s "$@"; then
        sudo apt-get -y install "$@"
    fi
}

deps nginx

install_nginx_conf router/nginx.conf router.nginx.conf
install_nginx_conf router/detect.conf router.detect.conf

nginx -s reload