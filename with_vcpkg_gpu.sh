set -e

sudo apt install autoconf bison gperf libtool libx11-dev libxkbcommon-x11-dev libx11-xcb-dev libxft-dev libxext-dev libgles2-mesa-dev libxi-dev libgl1-mesa-dev libglu1-mesa-dev mesa-common-dev libxrandr-dev libxxf86vm-dev -y

sudo apt install build-essential tar curl zip unzip libxcursor-dev libgtk2.0-dev -y

git clone https://github.com/microsoft/vcpkg.git

cd vcpkg && sh bootstrap-vcpkg.sh

./vcpkg install opencv4[contrib,core,cuda,cudnn,dnn,jpeg,png,tiff,webp] --recurse
