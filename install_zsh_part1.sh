#!/bin/bash
# Apache License 2.0
# Copyright (c) 2020, ROBOTIS CO., LTD.

echo ""
echo "[Setup ZSH Environment Part1]"
echo "[Note] OS version  >>> Ubuntu 20.04 (Focal Fossa) or Linux Mint 21.x"
echo ""
echo "PRESS [ENTER] TO CONTINUE THE INSTALLATION"
echo "IF YOU WANT TO CANCEL, PRESS [CTRL] + [C]"
read

echo "[Install ZSH]"
sudo apt install zsh -y 
chsh -s `which zsh`

echo "[Install oh my zsh]"
sudo apt install git
sudo apt install curl
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

echo "[Plase Reboot or resignin]"

exit 0
