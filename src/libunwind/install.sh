#!/usr/bin/env bash

WHAT=libunwind
VERSION=1.1
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

wget http://download.savannah.gnu.org/releases/libunwind/${WHAT}-${VERSION}.tar.gz

tar xvfz ${WHAT}-${VERSION}.tar.gz
mv ${WHAT}-${VERSION} ${VERSION}
cd ${VERSION}

./configure --prefix=${TARGETDIR}
make
make install
