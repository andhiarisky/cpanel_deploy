#!/bin/bash
#download-git
wget 
#recompile-easyapache4
mkdir -p /etc/cpanel/ea4/profiles/custom/
wget https://github.com/andhiarisky/cpanel_deploy/blob/main/ea-php72-php83.json -O /etc/cpanel/ea4/profiles/custom/eaphp72-83cl.json
/usr/local/bin/ea_install_profile --install /etc/cpanel/ea4/profiles/custom/eaphp70-80cl.json

#install-modsec360
/usr/local/cpanel/scripts/modsec_vendor add https://files.imunify360.com/static/modsec/v1/meta_imunify360_min.yaml

#copy-csf-conf
wget http://103.247.10.16/csf -O /etc/csf/csf.conf
csf -r

#copy-tweak-setting
wget http://103.247.10.16/cpanel -O /var/cpanel/cpanel.config
whmapi1 restore_config_from_file module=Main path=/var/cpanel/cpanel.config

#ubah-handler-lsapi
/usr/local/cpanel/bin/rebuild_phpconf --ea-php80=lsapi
/usr/local/cpanel/bin/rebuild_phpconf --ea-php74=lsapi
/usr/local/cpanel/bin/rebuild_phpconf --ea-php73=lsapi
/usr/local/cpanel/bin/rebuild_phpconf --ea-php72=lsapi
/usr/local/cpanel/bin/rebuild_phpconf --ea-php71=lsapi
/usr/local/cpanel/bin/rebuild_phpconf --ea-php70=lsapi
