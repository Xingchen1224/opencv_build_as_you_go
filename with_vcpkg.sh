set -e

sudo apt update -y

sudo apt install git -y

sudo apt install curl zip unzip tar -y

ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

sudo apt install build-essential tar curl zip unzip libxcursor-dev libgtk2.0-dev -y

# Common Tool for opencv4
sudo apt install libx11-dev libxkbcommon-x11-dev libx11-xcb-dev libxft-dev libxext-dev -y

sudo apt install libxi-dev libgl1-mesa-dev libglu1-mesa-dev mesa-common-dev libxrandr-dev libxxf86vm-dev -y

sudo apt install autoconf gperf libtool -y

sudo apt install bison -y

sudo apt install aria2 -y

git clone https://github.com/microsoft/vcpkg.git

cd vcpkg && sh bootstrap-vcpkg.sh

./vcpkg install opencv4 --recurse
