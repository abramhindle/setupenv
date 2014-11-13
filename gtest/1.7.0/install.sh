#!/usr/bin/env bash

VERSION=1.7.0

wget http://googletest.googlecode.com/files/gtest-${VERSION}.zip
unzip gtest-${VERSION}.zip
mv gtest-${VERSION} src
cd src
./configure --prefix=`realpath ..`/bin
make
cd ..
