mkdir Noto
cd Noto
mkdir -p system/fonts
mkdir -p META-INF/com/google/android
wget https://github.com/dmlls/whatsapp-emoji-linux/releases/download/2.23.2.72-1/WhatsAppEmoji.ttf -O system/fonts/NotoColorEmoji.ttf
wget https://raw.githubusercontent.com/topjohnwu/Magisk/master/scripts/module_installer.sh -O META-INF/com/google/android/update-binary
echo "#MAGISK" > META-INF/com/google/android/updater-script
wget https://raw.githubusercontent.com/rocket100/WA-Android-System-Font/main/module.prop
7z a WA.zip *
