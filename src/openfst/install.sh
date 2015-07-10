#!/usr/bin/env bash

WHAT=openfst
VERSION=1.4.1
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

ORIGDIR=${PWD}
TEMPDIR=`mktemp -d`
cd ${TEMPDIR}

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
