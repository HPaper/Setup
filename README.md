# Ubuntu 20.04 Setup

## ROS2 Foxy
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
![Powerlevel10k](
https://raw.githubusercontent.com/romkatv/powerlevel10k-media/master/prompt-styles-high-contrast.png)

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
```
p10k configure
```

- EASY Intasll

To do all of the above settings at once, enter the command below
``` bash
$ wget https://raw.githubusercontent.com/HPaper/Setup/master/install_zsh.sh && chmod 755 ./install_zsh.sh && ./install_zsh.sh
```

## Chrome
``` bash
$ wget https://raw.githubusercontent.com/HPaper/Setup/master/install_chrome.sh && chmod 755 ./install_chrome.sh && ./install_chrome.sh
```


## IDE
- Qt Creater
``` bash
$ wget https://qtcreator-ros.datasys.swri.edu/downloads/installers/bionic/qtcreator-ros-bionic-latest-online-installer.run && chmod u+x qtcreator-ros-bionic-latest-online-installer.run && ./qtcreator-ros-bionic-latest-online-installer.run
```
- Visual Studio Code
``` bash
sudo apt install -y code
```