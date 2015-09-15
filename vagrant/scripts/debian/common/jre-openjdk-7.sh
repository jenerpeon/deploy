#!/usr/bin/env bash

INSTALL="apt-get install -y --force-yes --no-install-recommends"
UPDATE="apt-get update"
PACKAGES="openjdk-7-jre"

eval "$UPDATE"
eval "$INSTALL $PACKAGES"

exit 0
