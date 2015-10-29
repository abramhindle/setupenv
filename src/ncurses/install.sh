#!/usr/bin/env bash

WHAT=ncurses
VERSION=6.0
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

wget -N http://ftp.gnu.org/pub/gnu/ncurses/ncurses-${VERSION}.tar.gz

tar xvfz ncurses-${VERSION}.tar.gz
mv ncurses-${VERSION} ${VERSION}

patch -p0 < gcc5.2.patch

cd ${VERSION}

./configure --prefix=${TARGETDIR} --enable-overwrite
make
make install

cd ..
