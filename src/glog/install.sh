#!/usr/bin/env bash

WHAT=glog
VERSION=0.3.3
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

wget https://google-glog.googlecode.com/files/glog-${VERSION}.tar.gz

tar xf glog-${VERSION}.tar.gz
mv glog-${VERSION} ${VERSION}
cd ${VERSION}
./configure --prefix=${TARGETDIR} --enable-namespace=google
make
make install