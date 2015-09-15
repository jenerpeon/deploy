#!/usr/bin/env bash

INSTALL="-y --force-yes --no-install-recommends"
PACKAGES="tcos-dev git realpath aufs-tools debootstrap zsh mr vcsh gnupg-agent"
GITHUB_GIT="git@github.com:openthinclient/"
GITHUB_HTTP="https://github.com/openthinclient/"

echo "deb http://packages.openthinclient.org/openthinclient/v2/devel/ ./"> /etc/apt/sources.list.d/tcos-dev.list

apt-get update
eval apt-get install "$INSTALL $PACKAGES"

exit 0
