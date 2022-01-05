sudo apt install build-essential cmake pkg-config unzip yasm git checkinstall -y
sudo apt install libjpeg-dev libpng-dev libtiff-dev -y
sudo apt-get install gcc-10 g++11 -y
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 10
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-11 10
sudo update-alternatives --config gcc
sudo update-alternatives --config g++

OPENCV_VERSION=4.5.4
wget -O opencv.zip https://github.com/opencv/opencv/archive/refs/tags/$OPENCV_VERSION.zip
unzip -o opencv.zip

cd opencv-$OPENCV_VERSION
mkdir build
cd build

cmake -D CMAKE_BUILD_TYPE=RELEASE \
-D CMAKE_CXX_STANDARD=17 \
-D CMAKE_INSTALL_PREFIX=/usr/local \
-DBUILD_LIST=core,imcodec,improc,dnn \
-D OPENCV_GENERATE_PKGCONFIG=ON \
-D BUILD_EXAMPLES=OFF ..

sudo make -j$(nproc) install
