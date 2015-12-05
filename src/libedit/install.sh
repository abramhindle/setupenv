#!/usr/bin/env bash

WHAT=libedit
VERSION=3.1
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

wget http://thrysoee.dk/editline/libedit-20141030-${VERSION}.tar.gz
tar xvfz libedit-20141030-${VERSION}.tar.gz
mv libedit-20141029-${VERSION} ${VERSION}

cd ${VERSION}
./configure --prefix=${TARGETDIR}
make
make install
