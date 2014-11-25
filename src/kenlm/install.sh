#!/usr/bin/env bash

WHAT=kenlm
VERSION=`date +%Y-%m-%d`
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

git clone https://github.com/kpu/kenlm.git ${VERSION}
cd ${VERSION}
./bjam -j4 --prefix=${TARGETDIR}
cd ..
