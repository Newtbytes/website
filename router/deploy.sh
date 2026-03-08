#!/bin/bash

deps () {
    if ! dpkg -s "$@"; then
        sudo apt-get -y install "$@"
    fi
}

deps nginx

source .env
# shellcheck disable=SC2016
envsubst '$SUS_USER_AGENT_REGEX,$SUS_POSTAL_CODE_REGEX,$SUS_CITY_REGEX' \
    < router/nginx.conf                                                 \
    | sudo tee /etc/nginx/sites-available/router.nginx.conf > /dev/null

sudo ln -fL -v /etc/nginx/sites-available/router.nginx.conf /etc/nginx/sites-enabled/router.nginx.conf

nginx -s reload