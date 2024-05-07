#!/bin/bash
#recompile-easyapache4
mkdir -p /etc/cpanel/ea4/profiles/custom/
mv /usr/local/src/cpdeploy-main/ea-php72-php83.json /etc/cpanel/ea4/profiles/custom/ea-php72-php83.json
/usr/local/bin/ea_install_profile --install /etc/cpanel/ea4/profiles/custom/ea-php72-php83.json

#install-modsec360
/usr/local/cpanel/scripts/modsec_vendor add https://files.imunify360.com/static/modsec/v2/meta_imunify360-full-apache.yaml

#install csf, cmc, cmq
cd /usr/local/src/;wget https://download.configserver.com/csf.tgz;tar -zxvf csf.tgz;cd csf;./install.cpanel.sh;cd /usr/local/src/;wget https://download.configserver.com/cmq.tgz;tar -zxvf cmq.tgz;cd  cmq;./install.sh;cd /usr/local/src/;wget https://download.configserver.com/cmc.tgz;tar -zxvf cmc.tgz;cd  cmc;./install.sh

#copy-csf-conf
mv /usr/local/src/cpdeploy-main/csf.conf /etc/csf/csf.conf
csf -r

#copy-tweak-setting
mv /usr/local/src/cpdeploy-main/cpanel.config /var/cpanel/cpanel.config
whmapi1 restore_config_from_file module=Main path=/var/cpanel/cpanel.config
/scripts/restartsrv_cpsrvd

#update php.ini
mv /usr/local/src/cpdeploy-main/ea-php72.ini /opt/cpanel/ea-php72/root/etc/php.ini
mv /usr/local/src/cpdeploy-main/ea-php73.ini /opt/cpanel/ea-php73/root/etc/php.ini
mv /usr/local/src/cpdeploy-main/ea-php74.ini /opt/cpanel/ea-php74/root/etc/php.ini
mv /usr/local/src/cpdeploy-main/ea-php80.ini /opt/cpanel/ea-php80/root/etc/php.ini
mv /usr/local/src/cpdeploy-main/ea-php81.ini /opt/cpanel/ea-php81/root/etc/php.ini
mv /usr/local/src/cpdeploy-main/ea-php82.ini /opt/cpanel/ea-php82/root/etc/php.ini
mv /usr/local/src/cpdeploy-main/ea-php83.ini /opt/cpanel/ea-php83/root/etc/php.ini

#ubah-handler-lsapi
/usr/local/cpanel/bin/rebuild_phpconf --ea-php72=lsapi
/usr/local/cpanel/bin/rebuild_phpconf --ea-php73=lsapi
/usr/local/cpanel/bin/rebuild_phpconf --ea-php74=lsapi
/usr/local/cpanel/bin/rebuild_phpconf --ea-php80=lsapi
/usr/local/cpanel/bin/rebuild_phpconf --ea-php81=lsapi
/usr/local/cpanel/bin/rebuild_phpconf --ea-php82=lsapi
/usr/local/cpanel/bin/rebuild_phpconf --ea-php83=lsapi
