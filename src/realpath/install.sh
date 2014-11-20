#!/usr/bin/env bash

WHAT=realpath
VERSION=1.0
TARGETDIR=${PWD}/../../build/${WHAT}-${VERSION}

cd ${VERSION}
make
mkdir -p ${TARGETDIR}/bin
cp realpath ${TARGETDIR}/bin
cd ..
