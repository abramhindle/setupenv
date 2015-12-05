#!/usr/bin/env bash

WHAT=stxxl
VERSION=1.4.1
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

git clone https://github.com/stxxl/stxxl.git

cd stxxl
git tag -l
git checkout ${VERSION}

mkdir build
cd build
cmake ../ -DCMAKE_INSTALL_PREFIX=${TARGETDIR} -DBUILD_STATIC_LIBS=OFF -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release
make -j4
make install
