#!/bin/bash
#コピペ元
#https://nekonogorogoro.com/raspberrypi_car_vol2/


#以下のコマンドを実行後に実行できる
#sed -i 's/\r//' *.sh

wget https://sourceforge.net/projects/webiopi/files/WebIOPi-0.7.1.tar.gz
tar xvzf WebIOPi-0.7.1.tar.gz

cd WebIOPi-0.7.1

wget https://raw.githubusercontent.com/doublebind/raspi/master/webiopi-pi2bplus.patch
patch -p1 -i webiopi-pi2bplus.patch

sudo apt update
sudo apt install python-dev-is-python3 -y
sudo apt install python-setuptools-doc -y
sudo ./setup.sh


cd /etc/systemd/system/
sudo wget https://raw.githubusercontent.com/doublebind/raspi/master/webiopi.service

sudo systemctl start webiopi
