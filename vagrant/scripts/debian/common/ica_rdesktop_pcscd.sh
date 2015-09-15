#!/usr/bin/env bash

INSTALL="apt-get install -y --force-yes --no-install-recommends"
INSTALL_SINGLE="dpkg -i"
UPDATE="apt-get update"
PACKAGES="pcscd rdesktop freerdp libxerces-c3.1"

eval "$INSTALL $PACKAGES"

# EXTERNAL DEBs
eval "$INSTALL_SINGLE /vagrant_data/packages/*"

# ADD CUSTOM KEYS TO ICACLIENT

 cd /opt/Citrix/ICAClient/keystore/cacerts/ && \
     cp /vagrant_data/certs/* . && \
     c_rehash .

exit 0
