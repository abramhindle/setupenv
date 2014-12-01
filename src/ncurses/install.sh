#!/usr/bin/env bash

WHAT=ncurses
VERSION=5.9
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

wget http://ftp.gnu.org/pub/gnu/ncurses/ncurses-${VERSION}.tar.gz

tar xvfz ncurses-${VERSION}.tar.gz
mv ncurses-${VERSION} ${VERSION}

cd ${VERSION}

./configure --prefix=${TARGETDIR} --enable-overwrite
make
make install

cd ..
