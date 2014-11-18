#!/usr/bin/env bash

WHAT=realpath
VERSION=1.0
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

cd ${VERSION}
make
mkdir -p ${TARGETDIR}
cp realpath ${TARGETDIR}
cd ..
