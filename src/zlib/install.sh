#!/usr/bin/env bash

WHAT=zlib
VERSION=1.2.8
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

wget -N http://fossies.org/linux/misc/zlib-${VERSION}.tar.gz

tar xvfz zlib-${VERSION}.tar.gz
cd zlib-${VERSION}
./configure --prefix=${TARGETDIR}
make
make install
cd ..
