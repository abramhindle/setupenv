#!/usr/bin/env bash

WHAT=opendetex
VERSION=2.8.1
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}
UNAME=$(uname)
BUILDDIR=`mktemp -d /tmp/build-${WHAT}-${VERSION}-XXXXXXXXXX`

echo >&2 "building in ${BUILDDIR}"

cd ${BUILDDIR}
wget https://opendetex.googlecode.com/files/${WHAT}-${VERSION}.tar.bz2
tar xvf ${WHAT}-${VERSION}.tar.bz2 || exit 1
mv ${WHAT} ${VERSION} || exit 1
cd ${VERSION} || exit 1

make

mkdir -p ${TARGETDIR}/bin
cp detex ${TARGETDIR}/bin
cp delatex ${TARGETDIR}/bin

rm -rf ${BUILDDIR}
