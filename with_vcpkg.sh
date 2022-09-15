set -e

sudo apt install libgles2-mesa-dev -y

git clone https://github.com/microsoft/vcpkg.git

cd vcpkg && sh bootstrap-vcpkg.sh

./vcpkg install opencv4 --recurse
