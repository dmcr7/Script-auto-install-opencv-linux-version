#!/bin/bash

echo "======================================================="
echo "Welcome to Configuration Generator"
echo "======================================================="
echo "This process will be install the latest opencv2 and compile opencv3 manually."
echo "So, you must determine the latest version of opencv3 to install."
echo 'Check latest opencv3 version at https://www.opencv.org/releases.html'
read -p "Enter the latest opencv3 version [Lates opencv3: 3.4.3]: " VERSION

# Installation
sudo apt update
sudo apt install -y build-essential
sudo apt install -y cmake
sudo apt install -y libgtk2.0-dev
sudo apt install -y pkg-config
sudo apt install -y libopencv-dev
sudo apt install -y python-numpy python-dev
sudo apt install -y libavcodec-dev libavformat-dev libswscale-dev
sudo apt install -y libtbb2 libjpeg-dev libtbb-dev libpng-dev libtiff5-dev libdc1394-22-dev

read -n1 -r -p "Download opencv-${VERSION}. press ENTER to continue!" ENTER
if [[ ! -f opencv-${VERSION}.zip ]]; then
	wget -O opencv-${VERSION}.zip https://github.com/opencv/opencv/archive/${VERSION}.zip
fi

read -n1 -r -p "Extract opencv. press ENTER to continue!" ENTER
if [[ ! -d opencv-${VERSION} ]]; then
	unzip opencv-${VERSION}.zip
fi

read -n1 -r -p "Select build with CMAKE. press ENTER to continue!" ENTER
cd opencv-${VERSION}
mkdir build
cd build

cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local ..

read -n1 -r -p "Build and install opencv. press ENTER to continue!" ENTER
make all -j4

ldconfig

sudo make install

read -n1 -r -p "Clean installation files. press ENTER to continue!" ENTER
cd ../..
rm -rf opencv_contrib-${VERSION} opencv.zip opencv_contrib.zip

echo " "
echo 'OpenCV auto installation script for Debian/Ubuntu'
echo " "
echo 'Copyright (c) 2017 Rohman Widiyanto & Dito Prabowo'
echo 'B201 - Network Development Group'
echo " "
echo 'Permission is hereby granted, free of charge, to any person obtaining a'
echo 'copy of this software and associated documentation files (the "Software"),'
echo 'to deal in the Software without restriction, including without limitation'
echo 'the rights to use, copy, modify, merge, publish, distribute, sublicense,'
echo 'and/or sell copies of the Software, and to permit persons to whom the'
echo 'Software is furnished to do so, subject to the following conditions:'
echo " "
echo 'The above copyright notice and this permission notice shall be included in'
echo 'all copies or substantial portions of the Software.'
echo " "
echo 'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR'
echo 'IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,'
echo 'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL'
echo 'THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER'
echo 'LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING'
echo 'FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER'
echo 'DEALINGS IN THE SOFTWARE.'
