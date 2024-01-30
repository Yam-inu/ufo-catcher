#!/bin/bash
#参照
#https://nekonogorogoro.com/raspberrypi_car_vol2/

#メインファイルのインストール
wget https://sourceforge.net/projects/webiopi/files/WebIOPi-0.7.1.tar.gz
tar xvzf WebIOPi-0.7.1.tar.gz

cd WebIOPi-0.7.1

#修正パッチのインストール、パッチ適用
wget https://raw.githubusercontent.com/doublebind/raspi/master/webiopi-pi2bplus.patch
patch -p1 -i webiopi-pi2bplus.patch

# ./setupのうちバージョン変更等でインストールできなくなったものをインストール
sudo apt update
sudo apt install python-dev-is-python3 -y
sudo apt install python-setuptools-doc -y

#セットアップ
sudo ./setup.sh

#systemctlでwebiopiを使えるようにする
cd /etc/systemd/system/
sudo wget https://raw.githubusercontent.com/doublebind/raspi/master/webiopi.service
