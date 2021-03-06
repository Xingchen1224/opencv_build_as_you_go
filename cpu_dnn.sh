OPENCV_VERSION=$1

wget -O opencv.zip -q https://github.com/opencv/opencv/archive/refs/tags/$OPENCV_VERSION.zip
unzip -o -qq opencv.zip

cd opencv-$OPENCV_VERSION
mkdir build
cd build

cmake -D CMAKE_BUILD_TYPE=RELEASE \
-D CMAKE_CXX_STANDARD=14 \
-D CMAKE_INSTALL_PREFIX=/usr/local \
-DBUILD_LIST=core,imgcodecs,imgproc,dnn \
-D OPENCV_GENERATE_PKGCONFIG=ON \
-D BUILD_EXAMPLES=OFF ..

cmake --build . --config Release -j 2
sudo cmake --install .
