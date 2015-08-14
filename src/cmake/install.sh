#!/usr/bin/env bash

WHAT=cmake
VERSION=3.1.0-rc2
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

# this is already a binary release
wget -N http://www.cmake.org/files/v3.1/cmake-${VERSION}.tar.gz
tar xvfz cmake-${VERSION}.tar.gz
mv cmake-${VERSION} ${VERSION}
cd ${VERSION}
./bootstrap --prefix=${TARGETDIR}
make
make install
cd ..
