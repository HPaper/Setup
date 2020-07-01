# Install ROS2 Foxy

Created: Jun 18, 2020 10:38 AM
Property: Paper H
Tags: ROS2

# Installation

## Step by step install

[Installing ROS 2 Foxy Fitzroy](https://index.ros.org/doc/ros2/Installation/Foxy/)

## Easy install

- One line Install

```
$ cd ~/tools
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros2_foxy.sh && chmod 755 ./install_ros2_foxy.sh && bash ./install_ros2_foxy.sh
```

- [install_ros2_foxy.sh](https://github.com/ROBOTIS-GIT/robotis_tools/blob/master/install_ros2_foxy.sh)

    ```bash
    #!/bin/bash
    # Apache License 2.0
    # Copyright (c) 2020, ROBOTIS CO., LTD.

    echo ""
    echo "[Note] OS version  >>> Ubuntu 20.04 (Focal Fossa) or Linux Mint 21.x"
    echo "[Note] Target ROS version >>> ROS 2 Foxy Fitzroy"
    echo "[Note] Colcon workspace   >>> $HOME/colcon_ws"
    echo ""
    echo "PRESS [ENTER] TO CONTINUE THE INSTALLATION"
    echo "IF YOU WANT TO CANCEL, PRESS [CTRL] + [C]"
    read

    echo "[Set the target ROS version and name of colcon workspace]"
    name_ros_version=${name_ros_version:="foxy"}
    name_colcon_workspace=${name_colcon_workspace:="colcon_ws"}

    echo "[Setup Locale]"
    sudo locale-gen en_US en_US.UTF-8
    sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
    export LANG=en_US.UTF-8

    echo "[Setup Sources]"
    sudo rm -rf /var/lib/apt/lists/* && sudo apt update && sudo apt install -y curl gnupg2 lsb-release
    curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
    sudo sh -c 'echo "deb http://packages.ros.org/ros2/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list'

    echo "[Install ROS 2 packages]"
    sudo apt update && sudo apt install -y ros-$name_ros_version-desktop

    echo "[Environment setup]"
    source /opt/ros/$name_ros_version/setup.sh
    sudo apt install -y python3-argcomplete python3-colcon-common-extensions python3-vcstool

    echo "[Make the colcon workspace and test colcon build]"
    mkdir -p $HOME/$name_colcon_workspace/src
    cd $HOME/$name_colcon_workspace
    colcon build --symlink-install

    echo "[Set the ROS evironment]"
    sh -c "echo \"alias nb='nano ~/.bashrc'\" >> ~/.bashrc"
    sh -c "echo \"alias sb='source ~/.bashrc'\" >> ~/.bashrc"
    sh -c "echo \"alias gs='git status'\" >> ~/.bashrc"
    sh -c "echo \"alias gp='git pull'\" >> ~/.bashrc"

    sh -c "echo \"alias cw='cd ~/$name_colcon_workspace'\" >> ~/.bashrc"
    sh -c "echo \"alias cs='cd ~/$name_colcon_workspace/src'\" >> ~/.bashrc"
    sh -c "echo \"alias cb='cd ~/$name_colcon_workspace && colcon build --symlink-install && source ~/.bashrc'\" >> ~/.bashrc"

    sh -c "echo \"source /opt/ros/$name_ros_version/setup.bash\" >> ~/.bashrc"
    sh -c "echo \"source ~/$name_colcon_workspace/install/local_setup.bash\" >> ~/.bashrc"

    exec bash

    echo "[Complete!!!]"
    exit 0
    ```

## Setting example

```
################################################################################
### User rc(run commands) settings
### for ROS 1 and 2 Projects
################################################################################

### Set CMake to detect and use Clang
#export CC=clang-6.0
#export CXX=clang++-6.0

### Set the arduino path
export PATH=$PATH:$HOME/tools/arduino-1.8.9

### Set the ROS declaration
ROS_V=2 # Select ROS Version 1 or 2
# ROS_VERSION='2'
# ROS_DISTRO='dashing'
# ROS_PYTHON_VERSION='3'

### Set the colcon and vcstool auto-completion on bash
source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash
source /usr/share/vcstool-completion/vcs.bash

### Set the alias commands (common)
alias vr='vim ~/.bashrc'
alias vv='vim ~/.vimrc'
alias sr='source ~/.bashrc'
alias gs='git status'
alias gp='git pull'
alias gc='git commit -s -m'
alias killgazebo='killall -9 gazebo & killall -9 gzserver  & killall -9 gzclient'

if [ $ROS_V -eq 1 ]; then
  ### Set the alias command and environment for ROS 1
  alias cw='cd ~/catkin_ws'
  alias cs='cd ~/catkin_ws/src'
  alias cm='cd ~/catkin_ws && catkin_make'

  source /opt/ros/melodic/setup.bash
  source ~/catkin_ws/devel/setup.bash

  export ROS_MASTER_URI=http://localhost:11311
  export ROS_HOSTNAME=localhost

  export TURTLEBOT3_MODEL=burger
  #export TURTLEBOT3_MODEL=waffle_pi
elif [ $ROS_V -eq 2 ]; then
  ### Set the alias commands and environment for ROS 2
  alias cw='cd ~/robotis_ws'
  alias cs='cd ~/robotis_ws/src'

  alias cb='cd ~/robotis_ws && colcon build --symlink-install'
  alias cbs='colcon build --symlink-install'
  alias cbp='colcon build --symlink-install --packages-select'

  alias rt='ros2 topic list'
  alias rn='ros2 node list'

  alias af='ament_flake8'
  alias ac='ament_cpplint'

  #alias ros2_init='. /opt/ros/dashing/setup.bash'
  alias ros2_init='. ~/ros2_ws/install/local_setup.bash'
  alias robotis_init='. ~/robotis_ws/install/local_setup.bash'
  alias all_init='. ~/ros2_ws/install/local_setup.bash && . ~/robotis_ws/install/local_setup.bash'

  #source /opt/ros/dashing/setup.bash
  #source ~/ros2_ws/install/local_setup.bash
  #source ~/robotis_ws/install/local_setup.bash

  ### Set the ROS 2 domain ID
  export ROS_DOMAIN_ID=1 # Default
  #export ROS_DOMAIN_ID=2 # Developer
  #export ROS_DOMAIN_ID=3 # Developer
  #export ROS_DOMAIN_ID=4 # Developer
  #export ROS_DOMAIN_ID=5 # Developer
  #export ROS_DOMAIN_ID=6 # Developer
  #export ROS_DOMAIN_ID=30 # TurtleBot3

  ### Set rmw implementation
  export RMW_IMPLEMENTATION=rmw_fastrtps_cpp
  #export RMW_IMPLEMENTATION=rmw_connext_cpp
  #export RMW_IMPLEMENTATION=rmw_opensplice_cpp

  ### Set the alias commands for test
  alias testpub='ros2 run demo_nodes_cpp talker'
  alias testsub='ros2 run demo_nodes_cpp listener'
  alias testpubimg='ros2 run image_tools cam2image'
  alias testsubimg='ros2 run image_tools showimage'
fi

: <<'END_COMMENT'
END_COMMENT

################################################################################
```