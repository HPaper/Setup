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
sed -i "s/plugins=(git)/plugins=(\\ git\\ zsh-autosuggestions\\ zsh-syntax-highlighting\\ )/" ~/.zshrc

echo "[Install powerlevel10k theme]"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i "s/ZSH_THEME=\"/#ZSH_THEME=\"/" ~/.zshrc
sed -i'' -r -e "/#ZSH_THEME/i\ZSH_THEME=\"powerlevel10k/powerlevel10k\"" ~/.zshrc

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
sh -c "echo \"alias cr='cd ~/$name_colcon_workspace && rm -rf build install log'\" >> ~/.zshrc"
sh -c "echo \"alias cb='cd ~/$name_colcon_workspace && colcon build --symlink-install && source ~/.zshrc'\" >> ~/.zshrc"
sh -c "echo \"alias ct='cd ~/colcon_ws && colcon test && colcon test-result --verbose'\" >> ~/.zshrc"
sh -c "echo \"alias ci='cd ~/colcon_ws && rosdep install --from-paths src --ignore-src -r --rosdistro dashing -y'\" >> ~/.zshrc"

sh -c "echo \"alias ka='killall -9'\" >> ~/.zshrc"
sh -c "echo \"alias kg='killall -9 gazebo & killall -9 gzserver  & killall -9 gzclient'\" >> ~/.zshrc"

sh -c "echo \"source /opt/ros/$name_ros_version/setup.zsh\" >> ~/.zshrc"
sh -c "echo \"source ~/$name_colcon_workspace/install/local_setup.zsh\" >> ~/.zshrc"

sh -c "echo \"export ROS_DOMAIN_ID=29\" >> ~/.zshrc"

source $HOME/.zshrc

echo "[Complete!!!]"
exit 0
