#!/usr/bin/env bash

WHAT=pv
VERSION=1.6.0
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

wget -N http://www.ivarch.com/programs/sources/pv-${VERSION}.tar.bz2 || exit 1

tar xvf pv-${VERSION}.tar.bz2 || exit 1
mv pv-${VERSION} ${VERSION} || exit 1
cd ${VERSION} || exit 1

./configure --prefix=${TARGETDIR} || exit 1
make || exit 1
make install || exit 1
