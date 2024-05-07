script cpdeploy ini digunakan untuk OS Almalinux 8.9 yang masih support ea-php73 keatas.
script ini dijalankan setelah proses instalasi cPanelnya selesai dilakukan.

1. wget https://github.com/andhiarisky/cpdeploy/archive/refs/heads/main.zip -O /usr/local/src/cpanel_deploy.zip
2. cd /usr/local/src/ && unzip cpanel_deploy.zip
3. sh /usr/local/src/cpdeploy-main/vps-standard.sh
