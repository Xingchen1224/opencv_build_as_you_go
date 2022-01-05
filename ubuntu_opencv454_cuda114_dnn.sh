sudo apt install build-essential cmake pkg-config unzip yasm git checkinstall -y
sudo apt install libjpeg-dev libpng-dev libtiff-dev -y

OPENCV_VERSION=4.5.4
CUDA_VERSION=11.4
CUDA_ARCH_BIN=7.0

wget -O opencv.zip https://github.com/opencv/opencv/archive/refs/tags/$OPENCV_VERSION.zip
wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/refs/tags/$OPENCV_VERSION.zip
unzip -o opencv.zip
unzip -o opencv_contrib.zip

cd opencv-$OPENCV_VERSION
mkdir build
cd build

cmake -D CMAKE_BUILD_TYPE=RELEASE \
-D CMAKE_CXX_STANDARD=17 \
-D CMAKE_INSTALL_PREFIX=/usr/local \
-DBUILD_LIST=core,imcodec,improc,dnn,cudev \
-D WITH_TBB=ON \
-D WITH_CUDA=ON \
-D WITH_CUDNN=ON \
-D OPENCV_DNN_CUDA=ON \
-D CUDA_ARCH_BIN=$CUDA_ARCH_BIN \
-D CUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda-$CUDA_VERSION \
-D OPENCV_GENERATE_PKGCONFIG=ON \
-D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-$OPENCV_VERSION/modules \
-D BUILD_EXAMPLES=OFF ..

sudo make -j$(nrpoc) install
