#!/usr/bin/env bash

WHAT=coin-cbc
VERSION=2.9
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

svn co https://projects.coin-or.org/svn/Cbc/stable/${VERSION} ${WHAT}

cd ${WHAT}

./configure -C --prefix=${TARGETDIR}
make
make test
make install
cd ../..
