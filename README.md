script cpdeploy ini digunakan untuk OS Almalinux 8.9 yang masih support ea-php72 keatas.
script ini dijalankan setelah proses instalasi cPanelnya selesai dilakukan.

Untuk instalasi cPanel pastikan sudah melakukan yum update sebelumnya, dan tambahkan file /root/cpanel_profile/cpanel.config dengan isi "mysql-version=10.6" (tanpa tanda petik)
Baru jalankan script installer cPanelnya berikut :

cd /usr/local/src && curl -o latest -L https://securedownloads.cpanel.net/latest && sh latest

Setelahnya lakukan compile php dan apache dengan menjalankan command dibawah ini :

1. wget https://github.com/andhiarisky/cpdeploy/archive/refs/heads/main.zip -O /usr/local/src/cpanel_deploy.zip
2. cd /usr/local/src/ && unzip cpanel_deploy.zip
3. sh /usr/local/src/cpdeploy-main/vps-standard.sh
