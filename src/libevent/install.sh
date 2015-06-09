#!/usr/bin/env bash

WHAT=libevent
VERSION=2.0.22-stable
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

wget http://softlayer-ams.dl.sourceforge.net/project/levent/libevent/libevent-2.0/libevent-${VERSION}.tar.gz
tar xvfz libevent-${VERSION}.tar.gz
mv libevent-${VERSION} ${VERSION}

cd ${VERSION}
./configure --prefix=${TARGETDIR}
make
make install
