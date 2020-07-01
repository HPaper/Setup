# ZSH

Created: Jun 18, 2020 10:38 AM
Property: Paper H
Tags: Ubuntu

# Install Zsh

Install zsh and set default shell

```
$ sudo apt install zsh -y 
$ chsh -s `which zsh`
```

## oh-my-zsh

Install git and oh-my-zsh

```
$ sudo apt install git
$ sudo apt install curl
$ curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh
```

Reboot or log in again

## Plug-in

Install useful plugin

```
$ git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
$ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
$ git clone https://github.com/zsh-users/zsh-completions $ZSH_CUSTOM/plugins/zsh-completions
```

Open `.zshrc` file.

```
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

## Theme

### powerlevel10k

![https://raw.githubusercontent.com/romkatv/powerlevel10k-media/master/prompt-styles-high-contrast.png](https://raw.githubusercontent.com/romkatv/powerlevel10k-media/master/prompt-styles-high-contrast.png)

[romkatv/powerlevel10k](https://github.com/romkatv/powerlevel10k#try-it-out)

Download and install powerlevel10k theme

```
$ git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
```

Open `.zshrc` file.

```
$ gedit ~/.zshrc
```

Set the plugin by writing the following in the file:

```
ZSH_THEME="powerlevel10k/powerlevel10k"
```

Restart Zsh and type following command if the configuration wizard doesn't start automatically.

```
$ p10k configure
```

# Setup ROS Environments

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

export ROS_DOMAIN_ID=1
```