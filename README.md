# Ubuntu 20.04 Setup

## ROS2 Foxy

<img src="https://t1.daumcdn.net/cfile/tistory/9997E4425EDC99272C" width="200">

- Install
``` bash
$ wget https://raw.githubusercontent.com/HPaper/Setup/master/install_ros2_foxy.sh && chmod 755 ./install_ros2_foxy.sh && ./install_ros2_foxy.sh
```

## ZSH

- Installation ZSH

Install zsh and set default shell
``` bash
$ sudo apt install zsh -y 
$ chsh -s `which zsh`
```

- oh-my-zsh

Install git and oh-my-zsh
``` bash
$ sudo apt install git
$ curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
```
Reboot or log in again

- Plug-in

Install useful plugin
``` bash
$ git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions --depth=1
$ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting --depth=1
```

Open `.zshrc` file.
``` bash
$ gedit ~/.zshrc
```

Set the plugin by writing the following in the file:
```
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    )
```

- Theme :
    - [powerlevel10k](https://github.com/romkatv/powerlevel10k#try-it-out)

<img src="https://raw.githubusercontent.com/romkatv/powerlevel10k-media/master/prompt-styles-high-contrast.png" width="500">


Download and install powerlevel10k theme
``` bash
$ git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
```
Open `.zshrc` file.
``` bash
$ gedit ~/.zshrc
```
Set the plugin by writing the following in the file:
```
ZSH_THEME="powerlevel10k/powerlevel10k"
```
Restart Zsh and type following command if the configuration wizard doesn't start automatically.
``` bash
$ p10k configure
```

If you want to run ROS in a ZSH environment, you need to change the ROS configuration from `~/.bashrc` to `~/.zshrc`.
```
alias gz='gedit ~/.zshrc'
alias sz='source ~/.zshrc'

alias gs='git status'
alias gp='git pull'

alias cw='cd ~/colcon_ws'
alias cs='cd ~/colcon_ws/src'
alias cr='cd ~/colcon_ws && rm -rf build install log'
alias cb='cd ~/colcon_ws && colcon build --symlink-install && source ~/.zshrc'
alias ct='cd ~/colcon_ws && colcon test && colcon test-result --verbose'
alias ci='cd ~/colcon_ws && rosdep install --from-paths src --ignore-src -r --rosdistro dashing -y'

alias ka='killall -9'
alias kg='killall -9 gazebo & killall -9 gzserver  & killall -9 gzclient'

source /opt/ros/foxy/setup.zsh
source ~/colcon_ws/install/local_setup.zsh

export ROS_DOMAIN_ID=29
```


## Chrome

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Google_Chrome_icon_%28September_2014%29.svg/1024px-Google_Chrome_icon_%28September_2014%29.svg.png" width="50">

``` bash
$ wget https://raw.githubusercontent.com/HPaper/Setup/master/install_chrome.sh && chmod 755 ./install_chrome.sh && ./install_chrome.sh
```


## IDE
- Qt Creater

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Qt_logo_2016.svg/1024px-Qt_logo_2016.svg.png" width="50">

``` bash
$ wget https://qtcreator-ros.datasys.swri.edu/downloads/installers/bionic/qtcreator-ros-bionic-latest-online-installer.run && chmod u+x qtcreator-ros-bionic-latest-online-installer.run && ./qtcreator-ros-bionic-latest-online-installer.run
```
- Visual Studio Code

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Visual_Studio_Code_1.35_icon.svg/1024px-Visual_Studio_Code_1.35_icon.svg.png" width="50">

``` bash
sudo apt install -y code
```