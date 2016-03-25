#!/usr/bin/env bash

WHAT=openfst
VERSION=1.5.0
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}
BUILDDIR=`mktemp -d /tmp/build-${WHAT}-${VERSION}-XXXXXXXXXX`

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

cp compat.h ${BUILDDIR}

cd ${BUILDDIR}

ORIGDIR=${PWD}

wget -N http://www.openfst.org/twiki/pub/FST/FstDownload/openfst-${VERSION}.tar.gz
tar xvfz openfst-${VERSION}.tar.gz

mv openfst-${VERSION} ${VERSION}
cd ${VERSION}

if [ "`uname -o`" == "GNU/Linux" ]; then
  echo >&2 "special treatments for linux ..."
  ./configure LDFLAGS=-Wl,--no-as-needed --prefix=${TARGETDIR}
else
  ./configure LDFLAGS=-Wl --prefix=${TARGETDIR}
fi

make -j3
make -j3 install
cd ${ORIGDIR}
cp -f compat.h ${TARGETDIR}/include/fst
