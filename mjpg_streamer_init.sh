#!/bin/bash
#コピペ元
#https://nekonogorogoro.com/raspberrypi_car_vol3/

#以下のコマンドを実行後に実行できる
#sed -i 's/\r//' *.sh

sudo apt update
sudo apt install build-essential imagemagick libv4l-dev libjpeg-dev cmake -y

git clone https://github.com/jacksonliam/mjpg-streamer.git
cd mjpg-streamer/mjpg-streamer-experimental
sudo make
sudo make install

sudo ./mjpg_streamer -i "./input_uvc.so -f 10 -r 640x480 -d /dev/video0 -y -n" -o "./output_http.so -w ./www -p 8080" 