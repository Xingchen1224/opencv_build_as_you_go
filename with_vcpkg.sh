set -e

apt update -y

apt install git -y

apt install curl zip unzip tar -y

ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

apt install build-essential tar curl zip unzip libxcursor-dev libgtk2.0-dev -y

# Common Tool for opencv4
apt install libx11-dev libxkbcommon-x11-dev libx11-xcb-dev libxft-dev libxext-dev -y

apt install libxi-dev libgl1-mesa-dev libglu1-mesa-dev mesa-common-dev libxrandr-dev libxxf86vm-dev -y

apt install autoconf gperf libtool -y

apt install bison -y

apt install aria2 -y

git clone https://github.com/microsoft/vcpkg.git

cd vcpkg && sh bootstrap-vcpkg.sh

./vcpkg install opencv4 --recurse
