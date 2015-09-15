#!/usr/bin/env bash

INSTALL="apt-get install -y --force-yes --no-install-recommends"
UPDATE="apt-get update"
PACKAGES="default-jre"

eval "$INSTALL $PACKAGES"

exit 0
