#!/usr/bin/env bash

WHAT=parallel
VERSION=20150922
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

wget -N http://ftp.gnu.org/gnu/parallel/${WHAT}-${VERSION}.tar.bz2

tar xvf ${WHAT}-${VERSION}.tar.bz2
mv ${WHAT}-${VERSION} ${VERSION}
cd ${VERSION}

./configure --prefix=${TARGETDIR}
make
make install
