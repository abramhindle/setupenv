#!/usr/bin/env bash

VERSION=1.4.9

wget http://www.hyperrealm.com/libconfig/libconfig-${VERSION}.tar.gz
tar xvfz libconfig-${VERSION}.tar.gz

mv libconfig-${VERSION} src
cd src
./configure --prefix=`realpath ..`/bin
make
make install
cd ..
