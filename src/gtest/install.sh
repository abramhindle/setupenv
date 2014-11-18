#!/usr/bin/env bash

WHAT=gtest
VERSION=1.7.0
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

wget http://googletest.googlecode.com/files/gtest-${VERSION}.zip
unzip gtest-${VERSION}.zip
mv gtest-${VERSION} ${VERSION}
cd ${VERSION}
./configure --prefix=${TARGETDIR}
make
make install
cd ..
