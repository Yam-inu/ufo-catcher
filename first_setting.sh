#!/bin/bash
#初期設定用シェルスクリプト
#制作：片岡大和

#以下のコマンドを実行後に実行できる
#sed -i 's/\r//' *.sh

#ユーザディレクトリを英語に変更
LC_ALL=C xdg-user-dirs-update --force
cd
rm -r ダウンロード テンプレート 公開 ドキュメント 音楽 ビデオ 画像


sudo apt update

sudo apt install fcitx-mozc -y
sudo apt install vim -y

sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

setxkbmap jp
