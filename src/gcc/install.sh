#!/usr/bin/env bash

WHAT=gcc
VERSION=4.9.2
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}
BUILDDIR=`mktemp -d`

echo >&2 "building in ${BUILDDIR}"

cd ${BUILDDIR}
wget ftp://ftp.fu-berlin.de/unix/languages/gcc/releases/gcc-${VERSION}/gcc-${VERSION}.tar.gz || exit 1
tar xfz gcc-${VERSION}.tar.gz || exit 1
mv gcc-${VERSION} ${VERSION} || exit 1
cd ${VERSION} || exit1

echo >&2 "downloading prerequisites"
./contrib/download_prerequisites || exit 1

mkdir build || exit 1
cd build || exit 1

LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:$LIBRARY_PATH 
export LIBRARY_PATH

../configure \
  --prefix=${TARGETDIR} \
  --enable-languages=c,c++ \
  --disable-bootstrap \
  --disable-multilib \
    && make -j32 && make install || exit 1

rm -rf ${BUILDDIR}
