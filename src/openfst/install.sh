#!/usr/bin/env bash

WHAT=openfst
VERSION=1.4.1
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

wget http://www.openfst.org/twiki/pub/FST/FstDownload/openfst-${VERSION}.tar.gz
tar xvfz openfst-${VERSION}.tar.gz

mv openfst-${VERSION} ${VERSION}
cd ${VERSION}
./configure LDFLAGS=-Wl,--no-as-needed --prefix=${TARGETDIR}
make
make install
cd ..
