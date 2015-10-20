#!/usr/bin/env bash

INSTALL="apt-get install -y --force-yes --no-install-recommends"
UPDATE="apt-get update"
PACKAGES="apache2 libxrender1 libxtst6"
OPENTHINCLIENT_INSTALLER=openthinclient-2.1-Pales.jar

eval "$INSTALL $PACKAGES"

# add user vagrant to www-data, so we upload the packages
usermod -a -G www-data,staff vagrant

# get the installer if necessary 
[ -f "/vagrant/data/${OPENTHINCLIENT_INSTALLER}" ] || ( cd /vagrant/data; wget -c http://packages.openthinclient.org/openthinclient/installer/${OPENTHINCLIENT_INSTALLER})

# provoke an exception to automate the installer
echo -e '\n' | java -jar /vagrant/data/openthinclient-*.jar -console || /bin/true
# move it to /opt
pwd
mv /usr/local/openthinclient /opt
chmod -R g+w /opt/openthinclient

# check, whether it starts automatically, disable rpcbind
ln -s /opt/openthinclient/bin/start.sh /etc/init.d/openthinclient
update-rc.d openthinclient defaults
update-rc.d -f rpcbind remove
ln -snf /bin/true /etc/init.d/rpcbind || /bin/true

# httpd
SOURCES_LIST="/opt/openthinclient/server/default/data/nfs/root/etc/sources.list"

mkdir -p /var/www/openthinclient/manager-rolling
sudo chown -R www-data:www-data /var/www/openthinclient/
sudo chmod -R g+w /var/www/openthinclient
touch /var/www/openthinclient/manager-rolling/packages
su -c "archive_metadata /var/www/openthinclient/manager-rolling" vagrant
/etc/init.d/openthinclient restart
exit 0
