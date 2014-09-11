# tcos-dev
#
# based on https://github.com/steffenhoenig/docker-openthinclient-dev
#
# VERSION	development

FROM joeyh/debian-stable-i386
MAINTAINER Steffen Hoenig "s.hoenig@openthinclient.com"

ENV DEBIAN_FRONTEND noninteractive

# sources.list
RUN :> /etc/apt/sources.list
RUN echo "deb http://http.debian.net/debian wheezy main contrib non-free" >> /etc/apt/sources.list.d/base.list
RUN echo "\ndeb-src http://http.debian.net/debian wheezy main contrib" >> /etc/apt/sources.list.d/base.list
RUN echo "deb http://http.debian.net/debian wheezy-backports main contrib non-free" >> /etc/apt/sources.list.d/backports.list
RUN echo "deb http://packages.openthinclient.org/openthinclient/v2/devel ./" >> /etc/apt/sources.list.d/tcos.list
RUN apt-get update
RUN apt-get -y --force-yes dist-upgrade

# adjust apt settings
RUN echo "APT::Install-Recommends \"0\";\nAPT::Install-Suggests \"0\";" > /etc/apt/apt.conf.d/01apt-get-install

# INSTALL
RUN apt-get install -y --force-yes less libparse-debcontrol-perl vim-nox emacs23-nox ca-certificates sudo locales devscripts build-essential git tcos-dev zsh rsync openssh-client



# SETUP
RUN echo "en_US.UTF-8 UTF-8\nde_DE.UTF-8 UTF-8" >> /etc/locale.gen
RUN locale-gen

CMD ["bash"]
