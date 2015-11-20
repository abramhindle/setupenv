#!/usr/bin/env bash

WHAT=libcurl
VERSION=7.45.0
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

wget -N http://curl.haxx.se/download/curl-${VERSION}.tar.gz

tar xvfz curl-${VERSION}.tar.gz

mv curl-${VERSION} ${VERSION}
cd ${VERSION}
./configure --prefix=${TARGETDIR}
make
make install
cd ..
