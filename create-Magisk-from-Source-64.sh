#!/bin/bash
git clone https://github.com/dmlls/whatsapp-emoji-linux

cd ~/whatsapp-emoji-linux
sed -i 's/160/64/g' Makefile
cd png
mkdir 64
mogrify -resize 64x64 -path ./64 160/*.png

cd ~/whatsapp-emoji-linux

python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
time make -j
deactivate

mkdir Magisk
cd Magisk
mkdir -p system/fonts
mkdir -p META-INF/com/google/android
cp ../build/WhatsAppEmoji.ttf system/fonts/NotoColorEmoji.ttf
wget https://raw.githubusercontent.com/topjohnwu/Magisk/master/scripts/module_installer.sh -O META-INF/com/google/android/update-binary
echo "#MAGISK" > META-INF/com/google/android/updater-script
wget https://raw.githubusercontent.com/rocket100/WA-Android-System-Font/main/module.prop
7z a Whatsapp-Emoji-64.zip *
