#!/usr/bin/env bash

INTERNAL_PACKAGES="rsync vim locales-all xauth realpath aufs-tools"
EXTERNAL_PACKAGES=""
RELEASE="wheezy"
INSTALL="apt-get install -y --force-yes --no-install-recommends"
INSTALL_SINGLE="dpkg -i"
UPDATE="apt-get update"

echo "deb http://http.debian.net/debian ${RELEASE} main contrib non-free" > /etc/apt/sources.list
echo "deb http://http.debian.net/debian ${RELEASE}-backports main contrib non-free" >> /etc/apt/sources.list

eval $UPDATE

[ -n "$INTERNAL_PACKAGES" ] && eval "$INSTALL -t ${RELEASE}-backports $INTERNAL_PACKAGES"

[ -n "$EXTERNAL_PACKAGES" ] && for file in $(echo $EXTERNAL_PACKAGES); do
    [ -f "/vagrant_data/packages/$deb" ] && eval "$INSTALL_SINGLE /vagrant/data/packages/$file"
done

[ ${1}x != x ] && groupadd -g 1111 "$1"; useradd -M -G vagrant,sudo -p $1 -s /bin/bash -u 1111 -g 1111 "$1"

echo aufs >> /etc/modules

exit 0
