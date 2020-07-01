# Setup Ubuntu 20.04

Created: Jun 18, 2020 10:38 AM
Property: Paper H
Tags: Ubuntu

# Backup files

- bashrc file (for user configurations, e.g., export, source, alias)
- network settings

# Install Ubuntu 20.04

- [Download image file](https://releases.ubuntu.com/20.04/)

[Ubuntu 20.04 LTS (Focal Fossa)](https://releases.ubuntu.com/20.04/)

# How to Create Swap Space on Ubuntu 20.04 & 18.04

1. check if the system has any swap configured.

    ```bash
    $ swapon --show
    ```

    If the output is blank, there is no swap configured

2. Create a Swap File

    `fallocate` 프로그램으로 swap file 만듬. 보통 RAM 의 2배 정도로 만듬. 요즘은 RAM 용량이 워낙 크니 적당히 만들면 됨.

    ```bash
    $ sudo fallocate -l 8G /swapfile
    ```

3. Configure Swap File

    swap file 을 root 만 access 가능하도록 권한 설정

    ```
    $ sudo chmod 600 /swapfile
    ```

    해당 파일을 swap file 로 mark

    ```
    $ sudo mkswap /swapfile
    ```

    시스템에 새로운 swap file 을 이용하라고 swapon 해 줌

    ```
    $ sudo swapon /swapfile
    ```

    swap file 이 사용되는지 확인

    ```
    $ sudo swapon --show
    or
    $ free -h
    ```

4. Make it Persistent

    이 swap file 은 재부팅하면 적용 안됨. 계속 적용되게 하기 위해서.. `/etc/fstab` 파일을 수정

    ```
    $ echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
    ```

5. Some Final Tweaks

    `swappiness` 값은 0 ~ 100 까지의 숫자이며, 리눅스가 메모리에서 swap 공간으로 데이터를 얼마나 적극적으로 이동시키는지를 나타냄. 숫자가 높으면 시스템이 메모리 부족 시 swap 으로 이동하는 것을 더욱 선호 함.
    현재 swappiness 설정을 보려면.. (보통 기본값은 60 임)

    ```
    $ cat /proc/sys/vm/swappiness
    ```

    램 용량이 크거나 SSD 를 사용한다면 이 값을 낮추는 것이 좋음. 혹은 서버에서도 낮춰주는게 좋음. 값을 변경하려면

    ```
    $ sudo sysctl vm.swappiness=10
    ```

    다음 부팅에서도 적용되게 하려면.. `/etc/sysctl.conf` 파일에 다음 내용을 넣으면 됨

    ```
    vm.swappiness=10
    ```

# Setup Language (Korean)

## Ibus

1. Settings → Region & Language → Manage Installed Languages → Install Korean
2. Log out and log back in -> Input Sources (+, Korean, Korean Hangul) -> Korean Setup -> Start in Hangul mode -> Apply
3. Switching languages: Super+Space

## fcitx

Install fcitx

1. Install fcitx

    ```
    $ sudo apt-get update
    $ sudo apt-get install fcitx-hangul
    ```

2. Change Keyboard
    1. System Setting →**Language Support→Keyboard input method system 을 [fcitx] 로 변경**
    2. 로그아웃 / 재 로그인!
3. 한글 입력 추가
    1. 데스트탑 우측 상단에 생긴 키보드 아이콘을 우클릭 하여 [Configure] 클릭
    2. [Input Method] - [+버튼 클릭]
    3. 검색창에 hangul 이라고 검색
    4. [Hangul] 선택 후 [OK]버튼 클릭
4. 한/영 키 사용 설정
    1. 위의 설정 화면에서 [Global Config] 탭을 선택
    2. [Trigger Input Method]의 버튼을 클릭하고 원하는 키 입력

# Setup Git

![https://pngimg.com/uploads/github/github_PNG30.png](https://pngimg.com/uploads/github/github_PNG30.png)

## Install the Git

- 리눅스의 경우
    - 윈도우용 소프트웨어 개발이 아닌 이상에는 우분투에서 커맨드 형태의 git 을 사용하는 것을 추천한다. 참고로 Visual Studio Code에서도 이를 지원하기도 한다.
    - Git 설치하기

    ```
    $ sudo apt install git
    ```

- 윈도우즈의 경우
    - 선택1) [https://desktop.github.com/](https://desktop.github.com/) 에서 GitHub Desktop을 다운로드하여 설치한다.
    - 선택2) [https://git-scm.com/downloads](https://git-scm.com/downloads) 에서 Git을 다운로드 하여 설치한다.
    - 선택3) 그 이외에도 [Git 관련 다양한 소프트웨어]가 있다.
    - 윈도우즈에서 Git 을 사용하는 경우에는 [CRLF 관련된 이슈]를 꼭 확인해야 한다.

## Basic Settings for Git

- 터미널 창에서 아래와 같이 이름과 이메일 주소(회원 가입시 사용한 주소)를 입력한다.
- `user.name` 은 꼭!꼭!꼭! 고정하여 사용할 것 (아래 내용 참조)
- 자신의 설정에 맞추어 변경할 것 (아래의 설정은 Gildong Hong의 경우임)

    ```
    $ git config --global user.name "Gildong Hong"
    $ git config --global user.email "hong@email.com"
    $ git config --global push.default simple
    $ git config --global color.ui auto
    ```

- 다음 명령어로 설정된 값을 확인해 볼 수 있다.

    ```
    $ git config --global --list
    ```

- SSH Key 설정
    - GitHub의 클론(clone) 방식으로는 https 및 SSH 를 사용할 수 있다. https는 별도 설정 없이 사용할 수 있다는 장점도 있고 아이디 및 패스워드등을 저장할 수 없는 카페 및 공개된 장소의 PC에서 사용하기에 적합하다.
    - 하지만 회사 및 개인 PC에서는 commit 및 pull request 등에서 매번 Github의 아이디 및 패스워드를 사용해야 한다. 이러한 불편함을 해소하기 위해서는 SSH 방식을 추천하는데 이를 사용하기 위해서는 다음과 같이 SSH Key를 생성하고 이를 GitHub에 등록해야 한다.

        ```
        $ ssh-keygen -t rsa -b 4096 -C "hong@email.com"

        Enter a file in which to save the key (/Users/you/.ssh/id_rsa): [Press enter]
        (ssh key 파일의 저장 위치를 변경하고자 할 때 그 주소를 입력한다. 일반적으로는 그냥 엔터)
        Enter passphrase (empty for no passphrase): [Type a passphrase]
        (문자형 암호를 추가한다. 특정 문자를 입력 후 엔터키를 누르도록 하자.)
        Enter same passphrase again: [Type passphrase again]
        (문자형 암호를 재확인하는 부분이다. 위와 동일한 문자를 입력 후 엔터키를 누르도록 하자. )

        $ ssh-add ~/.ssh/id_rsa		(ssh key 등록)
        $ cat ~/.ssh/id_rsa.pub		(cat 명령어로 화면에 출력되었다. ssh key를 복사하도록 하자. )
        ```

    - 웹브라우저에서 GitHub에 로그인 후, 화면의 오른쪽 상단의 메뉴에서 `Settings`를 클릭한다. 그 다음 보이는 메뉴 중에서 `SSH and GPG keys`를 선택한다.
    - 마지막으로 화면상의 `New SSH key`를 클릭 후, 이전에 id_rsa.pub의 내용을 복사한 것을 Key 입력창에 그대로 붙여 넣기 한다. Title입력란에 기입하지 않아도 된다. 그 뒤 `Add SSH key` 버튼을 클릭하는 것으로 Github에 SSH key를 등록하는 과정이 모두 끝났다. 이 설정 이후로는 등록한 PC에서 github의 클론(clone) 방식중에서 ssh 방식을 사용할 수 있다.
    - 사용하는 컴퓨터의 운영체제를 새로 깔았거나 다른 PC에서 SSH를 이용하여 GitHub를 이용하기 위해서는 새로운 SSH key를 추가해야 한다.
    - 참고 자료 → [Setting for Keys]

# IDE

## VSCode

![https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Visual_Studio_Code_1.35_icon.svg/1024px-Visual_Studio_Code_1.35_icon.svg.png](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Visual_Studio_Code_1.35_icon.svg/1024px-Visual_Studio_Code_1.35_icon.svg.png){: width="100" height="100"}

### Installation

```
sudo apt install -y code
```

### Set vcode's settings

- /home/YOURNAME/.config/Code/User/settings.json
- /home/YOURNAME/.config/Code/User/keybindings.json

### Install vcode's extensions

- /home/YOURNAME/.vscode/extensions

## QtCreater

![https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Qt_logo_2016.svg/1024px-Qt_logo_2016.svg.png](https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Qt_logo_2016.svg/1024px-Qt_logo_2016.svg.png){: width="100" height="100"}

### Installation

```
$ wget https://qtcreator-ros.datasys.swri.edu/downloads/installers/bionic/qtcreator-ros-bionic-latest-online-installer.run && chmod u+x qtcreator-ros-bionic-latest-online-installer.run && ./qtcreator-ros-bionic-latest-online-installer.run
```

- ROS Qt Creator Plug-in

    [How to Install (Users) - ROS Qt Creator Plug-in documentation](https://ros-qtc-plugin.readthedocs.io/en/latest/_source/How-to-Install-Users.html)

# Chrome

![https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Google_Chrome_icon_%28September_2014%29.svg/1024px-Google_Chrome_icon_%28September_2014%29.svg.png](https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Google_Chrome_icon_%28September_2014%29.svg/1024px-Google_Chrome_icon_%28September_2014%29.svg.png){: width="100" height="100"}

## Install

```
$ cd ~/Downloads && wget <https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb> && sudo dpkg -i google-chrome-stable_current_amd64.deb
```
