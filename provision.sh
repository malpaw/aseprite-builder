#!/bin/bash

apt-get update
apt-get upgrade
apt-get install -y git g++ cmake ninja-build libx11-dev libxcursor-dev python-minimal libfontconfig-dev freeglut3-dev libfontconfig-dev libfreetype6-dev libgif-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libqt4-dev

BASE_DIR=/home/vagrant/workspace

mkdir -p $BASE_DIR/deps
cd $BASE_DIR/deps
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
git clone -b aseprite-m67 https://github.com/aseprite/skia.git
export PATH="$BASE_DIR/deps/depot_tools:${PATH}"
cd skia
python tools/git-sync-deps
gn gen out/Release --args="is_debug=false is_official_build=true skia_use_system_expat=false skia_use_system_icu=false skia_use_system_libjpeg_turbo=false skia_use_system_libpng=false skia_use_system_libwebp=false skia_use_system_zlib=false"
ninja -C out/Release skia

cd $BASE_DIR
git clone --recursive https://github.com/aseprite/aseprite.git
cd $BASE_DIR/aseprite
mkdir -p build
cd $BASE_DIR/aseprite/build

cmake -DSKIA_DIR=$BASE_DIR/deps/skia -G Ninja ..
ninja aseprite

echo
echo all done.