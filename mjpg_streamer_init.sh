#!/bin/bash
#参照
#https://nekonogorogoro.com/raspberrypi_car_vol3/

sudo apt update
sudo apt install build-essential imagemagick libv4l-dev libjpeg-dev cmake -y

git clone https://github.com/jacksonliam/mjpg-streamer.git
cd mjpg-streamer/mjpg-streamer-experimental
sudo make
sudo make install
