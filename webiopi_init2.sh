#!/bin/bash
#コピペ元
#https://nekonogorogoro.com/raspberrypi_car_vol2/

#以下のコマンドを実行後に実行できる
#sed -i 's/\r//' *.sh


cd /home/pi/WebIOPi-0.7.1/htdocs/


########## index.html ##########

echo "<!DOCTYPE html>
<html lang=\"ja\">
<head>
<meta charset=\"utf-8\">
<title>ラズパイカメラ付きラジコン</title>
<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">
<link rel=\"stylesheet\" href=\"style.css\">
<script type=\"text/javascript\" src=\"/webiopi.js\"></script>
<script type=\"text/javascript\" src=\"motor.js\"></script>
<style>
  /* スタイルの追加 */
  .button-row {
    list-style-type: none;
    padding: 0;
    margin: 0;
    text-align: center;
  }

  .button {
    display: inline-block;
    width: 100px;
    height: 100px;
    background-color: #3498db;
    color: #ffffff;
    font-size: 18px;
    margin: 10px;
    cursor: pointer;
  }

  .a, .b, .c, .d, .e {
    display: block;
  }
</style>
</head>
<body>
<main>
    <div class=\"button-container\">
        <div class=\"button-row\">
            <button id=\"forward\" class=\"button\">前進</button>
        </div>
        <div class=\"button-row\">
            <button id=\"left\" class=\"button\">左旋回</button>
            <button id=\"stop\" class=\"button\">停止</button>
            <button id=\"right\" class=\"button\">右旋回</button>
        </div>
        <div class=\"button-row\">
            <button id=\"backward\" class=\"button\">後退</button>
        </div>
    </div>
</main>
</body>
</html>" > index.html



########## motor.js ##########

echo "w().ready(function() { 

    var motor = \"STOP\";
  
  // 「前進」ボタンが押されたときのイベント処理
    $('#forward').bind(BUTTON_DOWN, function(event) {
      // 押されたとき
      if(motor == \"STOP\") {
        $(this).addClass('ledon');
        change_motor('FOWARD');
      }
    }).bind(BUTTON_UP, function(event) {
      // 離したとき
      $(this).removeClass('ledon');
      change_motor('STOP');
    });
  
    // 「後退」ボタンが押されたときのイベント処理
    $('#backward').bind(BUTTON_DOWN, function(event) {
      if(motor == \"STOP\") {
        $(this).addClass('ledon');
        change_motor('BACKWARD');
      }
    }).bind(BUTTON_UP, function(event) {
      $(this).removeClass('ledon');
      change_motor('STOP');
    });
  
    // 「右」ボタンが押されたときのイベント処理
    $('#right').bind(BUTTON_DOWN, function(event) {
      if(motor == \"STOP\") {
        $(this).addClass('ledon');
        change_motor('RIGHT');
      }
    }).bind(BUTTON_UP, function(event) {
      $(this).removeClass('ledon');
      change_motor('STOP');
    });
  
    // 「左」ボタンが押されたときのイベント処理
    $('#left').bind(BUTTON_DOWN, function(event) {
      if(motor == \"STOP\") {
        $(this).addClass('ledon');
        change_motor('LEFT');
      }
    }).bind(BUTTON_UP, function(event) {
        $(this).removeClass('ledon');
      change_motor('STOP');
    });
  
   // 関数：モーターを動かすマクロ呼び出し
    function change_motor(type) {
      motor = type;
      if(type == \"FOWARD\") {             // 前進
        w().callMacro('FW');
      } else if(type == \"BACKWARD\") {    // 後進
        w().callMacro('BK'); 
      } else if(type == \"RIGHT\") {       // 右旋回
        w().callMacro('RT');
      } else if(type == \"LEFT\") {        // 左旋回
        w().callMacro('LT');
      } else if(type == \"STOP\") {       // 停止
        w().callMacro('ST');
      }
    }
  });" > motor.js



########## raspi_car_sp.py ##########

echo "# coding: utf-8
## inport文
import webiopi
import RPi.GPIO as GPIO

## 初期化
GPIO.setmode(GPIO.BCM)
motorGpioA1 = 18
motorGpioA2 = 23
motorGpioB1 = 24
motorGpioB2 = 13


def setup():
    GPIO.setup(motorGpioA1, GPIO.OUT)
    GPIO.setup(motorGpioA2, GPIO.OUT)
    GPIO.setup(motorGpioB1, GPIO.OUT)
    GPIO.setup(motorGpioB2, GPIO.OUT)


## 以下マクロ 前進 
@webiopi.macro
def FW():
    print(\"saaaaaaaaaaa\")
    GPIO.output(motorGpioA1,True)
    GPIO.output(motorGpioA2,False)
    GPIO.output(motorGpioB1,True)
    GPIO.output(motorGpioB2,False)

## 後退
@webiopi.macro
def BK():
    GPIO.output(motorGpioA1,False)
    GPIO.output(motorGpioA2,True)
    GPIO.output(motorGpioB1,False)
    GPIO.output(motorGpioB2,True)

## 左旋回
@webiopi.macro
def LT():
    GPIO.output(motorGpioA1,False)
    GPIO.output(motorGpioA2,True)
    GPIO.output(motorGpioB1,True)
    GPIO.output(motorGpioB2,False)
    
## 右旋回
@webiopi.macro
def RT():
    GPIO.output(motorGpioA1,True)
    GPIO.output(motorGpioA2,False)
    GPIO.output(motorGpioB1,False)
    GPIO.output(motorGpioB2,True)

## 停止
@webiopi.macro
def ST():
    GPIO.output(motorGpioA1,False)
    GPIO.output(motorGpioA2,False)
    GPIO.output(motorGpioB1,False)
    GPIO.output(motorGpioB2,False)" > raspi_car_sp.py

