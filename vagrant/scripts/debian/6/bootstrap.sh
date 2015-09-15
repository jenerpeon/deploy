#!/usr/bin/env bash

INTERNAL_PACKAGES="rsync vim"
EXTERNAL_PACKAGES=""
RELEASE="squeeze"
INSTALL="apt-get install -y --force-yes --no-install-recommends"
INSTALL_SINGLE="dpkg -i"
UPDATE="apt-get update"

echo "deb http://http.debian.net/debian ${RELEASE}-backports main" >> /etc/apt/sources.list.d/backports.list

eval "$UPDATE"

[ -n "$INTERNAL_PACKAGES" ] && eval "$INSTALL -t ${RELEASE}-backports $INTERNAL_PACKAGES"

[ -n "$EXTERNAL_PACKAGES" ] && for file in $(echo $EXTERNAL_PACKAGES); do
    [ -f "/vagrant_data/packages/$deb" ] && eval "$INSTALL_SINGLE /vagrant_data/packages/$file"
done

exit 0
