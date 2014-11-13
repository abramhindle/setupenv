#!/usr/bin/env bash

VERSION=1.4.1

wget http://www.openfst.org/twiki/pub/FST/FstDownload/openfst-${VERSION}.tar.gz
tar xvfz openfst-${VERSION}.tar.gz

mv openfst-${VERSION} src
cd src
./configure LDFLAGS=-Wl,--no-as-needed --prefix=`realpath ..`/bin
make
make install
cd ..
