#!/bin/bash

PORT="8080"
SIZE="320x240"
FRAMERATE="30"

echo "start webiopi"
sudo systemctl start webiopi

echo "start mjpg-streamer"
cd /home/pi/mjpg-streamer/mjpg-streamer-experimental
sudo ./mjpg_streamer -i "./input_uvc.so -f $FRAMERATE -r $SIZE -d /dev/video0 -y -n" -o "./output_http.so -w ./www -p $PORT"

