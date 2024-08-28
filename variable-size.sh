#!/bin/bash
PIXELSIZE=64
git clone https://github.com/dmlls/whatsapp-emoji-linux

cd ~/whatsapp-emoji-linux
sed -i 's/160/$PIXELSIZE/g' Makefile
cd png
mkdir $PIXELSIZE
mogrify -resize $PIXELSIZEx$PIXELSIZE -path ./$PIXELSIZE 160/*.png

