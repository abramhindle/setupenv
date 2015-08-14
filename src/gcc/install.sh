#!/usr/bin/env bash

WHAT=gcc
VERSION=4.9.2
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}
UNAME=$(uname)
BUILDDIR=`mktemp -d /tmp/build-${WHAT}-${VERSION}-XXXXXXXXXX`
THREADS=1

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

echo >&2 "building in ${BUILDDIR}"
cd ${BUILDDIR}
wget -N ftp://ftp.fu-berlin.de/unix/languages/gcc/releases/gcc-${VERSION}/gcc-${VERSION}.tar.gz || exit 1
tar xfz gcc-${VERSION}.tar.gz || exit 1
mv gcc-${VERSION} ${VERSION} || exit 1
cd ${VERSION} || exit1

echo >&2 "downloading prerequisites"
./contrib/download_prerequisites || exit 1

mkdir build || exit 1
cd build || exit 1

LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:$LIBRARY_PATH
LIBRARY_PATH=${LIBRARY_PATH%:}
export LIBRARY_PATH

if [ "`uname -o`" == "GNU/Linux" ]; then
  echo >&2 "special treatments for linux ..."
  ../configure \
    LDFLAGS=-Wl,--no-as-needed \
    --prefix=${TARGETDIR} \
    --enable-languages=c,c++ \
    --enable-multilib \
    --disable-bootstrap \
    --disable-multilib \
    && make -j${THREADS} && make install || exit 1
else
  ../configure \
    --prefix=${TARGETDIR} \
    --enable-languages=c,c++ \
    --enable-multilib \
    --disable-bootstrap \
    --disable-multilib \
    && make -j${THREADS} && make install || exit 1
fi

rm -rf ${BUILDDIR}
