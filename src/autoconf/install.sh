#!/usr/bin/env bash

WHAT=autoconf
VERSION=2.69
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

wget -N http://ftp.gnu.org/gnu/autoconf/${WHAT}-${VERSION}.tar.xz || exit 1

tar xvf ${WHAT}-${VERSION}.tar.xz || exit 1
mv ${WHAT}-${VERSION} ${VERSION} || exit 1
cd ${VERSION} || exit 1

./configure --prefix=${TARGETDIR} || exit 1
make || exit 1
make install || exit 1
