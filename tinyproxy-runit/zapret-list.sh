#!/bin/sh

if [ ! -d /usr/local/share/zapret ] && [ "$(curl -s https://get.geojs.io/v1/ip/country)" == "RU" ]; then
    mkdir -p /usr/local/share/zapret
    git clone --depth 1 https://github.com/zapret-info/z-i.git /usr/local/share/zapret
    (crontab -l 2>/dev/null; echo "0 12 */2 * * git -C /usr/local/share/zapret pull") | crontab -
    chown -R tinyproxy:tinyproxy /usr/local/share/zapret
    chmod 0750 /usr/local/share/zapret
fi
