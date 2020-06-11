#!/bin/bash
# Apache License 2.0
# Copyright (c) 2020, ROBOTIS CO., LTD.

echo ""
echo "[Setup ZSH Environment]"
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
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

echo "[Install Useful plugin]"
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions --depth=1
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting --depth=1
sed -i "s/plugins=(git)/plugins=(\ git\ zsh-autosuggestions\ zsh-syntax-highlighting\ )/" ~/.zshrc

urce $HOME/.zshrc

echo "[Set the target ROS version and name of colcon workspace]"
name_ros_version=${name_ros_version:="foxy"}
name_colcon_workspace=${name_colcon_workspace:="colcon_ws"}

echo "[Set the ROS evironment]"
sh -c "echo \"alias gz='gedit ~/.zshrc'\" >> ~/.zshrc"
sh -c "echo \"alias sb='source ~/.zshrc'\" >> ~/.zshrc"
sh -c "echo \"alias gs='git status'\" >> ~/.zshrc"
sh -c "echo \"alias gp='git pull'\" >> ~/.zshrc"

sh -c "echo \"alias cw='cd ~/$name_colcon_workspace'\" >> ~/.zshrc"
sh -c "echo \"alias cs='cd ~/$name_colcon_workspace/src'\" >> ~/.zshrc"
sh -c "echo \"alias cb='cd ~/$name_colcon_workspace && colcon build --symlink-install && source ~/.zshrc'\" >> ~/.zshrc"

sh -c "echo \"source /opt/ros/$name_ros_version/setup.zsh\" >> ~/.zshrc"
sh -c "echo \"source ~/$name_colcon_workspace/install/local_setup.zsh\" >> ~/.zshrc"

source $HOME/.zshrc

echo "[Complete!!!]"
exit 0
