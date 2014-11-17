#!/usr/bin/env bash

WHAT=libevent
VERSION=2.0.21-stable
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

wget https://github.com/downloads/libevent/libevent/libevent-${VERSION}.tar.gz
tar xvfz libevent-${VERSION}.tar.gz
mv libevent-${VERSION} ${VERSION}

cd ${VERSION}
./configure --prefix=${TARGETDIR}
make
make install
