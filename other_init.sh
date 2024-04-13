#!/bin/bash

# IPアドレスの固定
sudo apt update
sudo apt install dhcpcd -y

cd /etc
sudo chmod 666 dhcpcd.conf
echo "interface wlan0" >> dhcpcd.conf
echo "static ip_address=192.168.11.2/24" >> dhcpcd.conf
echo "static routers=192.168.11.1" >> dhcpcd.conf
echo "static domain_name_servers=192.168.11.1" >> dhcpcd.conf

# start_server.shの移動
sudo mv ~/ufo-catcher/start_server.sh /usr/local/bin/start_server

#webIOPiで参照されるファイルの入れ替え
cd /home/pi/ufo-catcher/WebIOPi-0.7.1/htdocs
mkdir original_file
mv *.* original_file
cd /home/pi/ufo-catcher
mv index.html raspi_car_sp.py motor.js ./WebIOPi-0.7.1/htdocs/

# configファイルの入れ替え
cd /etc/webiopi
sudo mv config config.org
sudo mv /home/pi/ufo-catcher/config ./

# 設定の完了のために再起動
#!/bin/bash

echo "更新の完了にはRaspberry Piの再起動が必要です"
echo "今すぐ再起動しますか？ yes/no"
read str
if [ ${str} = "yes" ]; then
  sudo reboot
elif [ ${str} = "no" ]; then
  echo "再起動できるようにし、以下のコマンドを自分で実行してください"
  echo "sudo reboot"
fi
