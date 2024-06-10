#!/bin/bash

## Delete old build files ##
rm -rf ~/deps

## Create build directory ##
mkdir ~/deps
cd ~/deps

## Clone required repos ##
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
git clone -b aseprite-m102 https://github.com/aseprite/skia.git
git clone --recursive https://github.com/aseprite/aseprite.git

## Set up PATH for build ##
export PATH="${PWD}/depot_tools:${PWD}/skia/out/Release-arm64:${PATH}"

## Build skia ##
cd skia
python3 tools/git-sync-deps
gn gen out/Release-arm64 --args="is_debug=false is_official_build=true skia_use_system_expat=false skia_use_system_icu=false skia_use_system_libjpeg_turbo=false skia_use_system_libpng=false skia_use_system_libwebp=false skia_use_system_zlib=false skia_use_sfntly=false skia_use_freetype=true skia_use_harfbuzz=true skia_pdf_subset_harfbuzz=true skia_use_system_freetype2=false skia_use_system_harfbuzz=false target_cpu=\"arm64\" extra_cflags=[\"-stdlib=libc++\", \"-mmacosx-version-min=11.0\"] extra_cflags_cc=[\"-frtti\"]"
ninja -C out/Release-arm64 skia modules

## Build aseprite ##
cd ~/deps/aseprite
git pull
git submodule update --init --recursive
mkdir build
cd build
cmake \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_OSX_ARCHITECTURES=arm64 \
  -DCMAKE_OSX_DEPLOYMENT_TARGET=11.0 \
  -DCMAKE_OSX_SYSROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk \
  -DLAF_BACKEND=skia \
  -DSKIA_DIR=$HOME/deps/skia \
  -DSKIA_LIBRARY_DIR=$HOME/deps/skia/out/Release-arm64 \
  -DSKIA_LIBRARY=$HOME/deps/skia/out/Release-arm64/libskia.a \
  -DPNG_ARM_NEON:STRING=on \
  -G Ninja \
  ..
ninja aseprite

## Turn into .app ##
rsync -arhP --delete-before bin/ /Applications/aseprite.app/
