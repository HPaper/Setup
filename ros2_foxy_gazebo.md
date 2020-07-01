# ROS2 Foxy Gazebo

Created: Jun 18, 2020 10:38 AM
Property: Paper H
Tags: ROS2

현재 ROS2 Foxy 버전 용 gazebo_ros_pkgs 는 release 되어 있지 않아서 apt 로 debian packages 로 설치할 수 없음. 따라서 source 설치를 해야 함. (@2020.06.17 기준)

# Install gazebo_ros_pkgs

- 아래 페이지의 Install from source (on Ubuntu)를 참고하여 설치

    [Installing gazebo_ros_pkgs (ROS 2)](http://gazebosim.org/tutorials?tut=ros2_installing&cat=connect_ros#Installgazebo_ros_pkgs)

- 소스를 download 할때, **gazebo_ros_pkgs** 리포지토리에서 사용할 ROS2 버전에 맞는 branch를 선택하여 받아야 한다.

**dashing**: works with Dashing debians or Dashing's [ros2.repos](https://raw.githubusercontent.com/ros2/ros2/dashing/ros2.repos).
**eloquent**: works with Eloquent debians or Eloquent's [ros2.repos](https://raw.githubusercontent.com/ros2/ros2/eloquent/ros2.repos).
**ros2**: points to the next unreleased ROS 2 turtle, currently Foxy.
It works with the master [ros2.repos](https://www.notion.so/robotissys/ROS2-Foxy-Gazebo-020d6e8fb7074acbb3787763818ac9bf#2f5e50e024204df98f1f1c3090d2c36a).

소스 받아와서 설치하는 순서는 아래와 같음.

1. `git` 설치

    ```
    $ sudo apt install git

    ```

2. workspace directory 로 가서 `gazebo_ros_pkgs` 를 얻기위한 파일 받아서 packages 를 받아옴.

    ```
    $ cd ~/robotis_ws
    $ wget <https://bitbucket.org/api/2.0/snippets/chapulina/geRKyA/f02dcd15c2c3b83b2d6aac00afe281162800da74/files/ros2.yaml>
    $ vcs import src < ros2.yaml

    ```

3. ROS2 distro 에 따라 branch 를 바꿔야 할 경우 아래와 같이 변경

    ```
    $ vcs custom --args checkout ros2

    ```

4. 모든 dependencies 설치 후 빌드

    ```
    $ sudo apt install -y python3-rosdep2
    $ rosdep update
    $ rosdep install --from-paths src --ignore-src -r -y
    $ colcon build --symlink-install

    ```