# coding: utf-8
## inport文
import webiopi
import RPi.GPIO as GPIO

##　初期化
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


## 以下マクロ　前進　
@webiopi.macro
def FW():
    print("saaaaaaaaaaa")
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
    GPIO.output(motorGpioB2,False)
