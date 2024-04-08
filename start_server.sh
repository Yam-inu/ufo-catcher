#!/bin/bash

#設定
PORT="8080"          #ポート番号
SIZE="320x240"       #解像度
FRAMERATE="30"       #フレームレート

#webiopiスタート
echo "start webiopi"
sudo systemctl stop webiopi
sudo systemctl start webiopi

#mjpg-streamerスタート
echo "start mjpg-streamer"
cd /home/pi/ufo-catcher/mjpg-streamer/mjpg-streamer-experimental
sudo ./mjpg_streamer -i "./input_uvc.so -f $FRAMERATE -r $SIZE -d /dev/video0 -y -n" -o "./output_http.so -w ./www -p $PORT"
