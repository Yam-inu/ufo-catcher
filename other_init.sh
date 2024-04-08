#!/bin/bash

# IPアドレスの固定
sudo apt update
sudo apt install dhcpcd -y

cd /etc
echo "interface wlan0" >> dhcpcd.conf
echo "static ip_address=192.168.11.2/24" >> dhcpcd.conf
echo "static routers=192.168.11.1" >> dhcpcd.conf
echo "static domain_name_servers=192.168.11.1" >> dhcpcd.conf

# start_server.shの移動
sudo mv start_server.sh /usr/local/bin/start_server

#webIOPiで参照されるファイルの入れ替え
cd /home/pi/ufo-catcher/webIOPi-0.7.1/htdocs
mkdir original_file
mv *.* original_file
cd /home/pi/ufo-catcher
mv index.html raspi_car_sp.py motor.js ./webIOPi-0.7.1/htdocs/
