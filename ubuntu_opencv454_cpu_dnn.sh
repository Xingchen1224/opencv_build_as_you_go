sudo apt install build-essential cmake pkg-config unzip yasm git checkinstall -y
sudo apt install libjpeg-dev libpng-dev libtiff-dev -y

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

sudo make -j$(nrpoc) install
