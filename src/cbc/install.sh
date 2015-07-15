#!/usr/bin/env bash

WHAT=cbc
VERSION=2.8
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

svn co https://projects.coin-or.org/svn/Cbc/stable/2.8 ${VERSION}
cd ${VERSION}
./configure -C -prefix=${TARGETDIR}
make
make test
make install
cd ..
