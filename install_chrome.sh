#!/bin/bash
# Apache License 2.0
# Copyright (c) 2020, ROBOTIS CO., LTD.

echo ""
echo "INSTALL GOOGLE CHROME BROWSER"
echo ""
echo "PRESS [ENTER] TO CONTINUE THE INSTALLATION"
echo "IF YOU WANT TO CANCEL, PRESS [CTRL] + [C]"
read

echo "[DOWNLOAD]"
cd ~/Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

echo "[INSTALL]"
sudo dpkg -i google-chrome-stable_current_amd64.deb

echo "[Complete!!!]"
exit 0
