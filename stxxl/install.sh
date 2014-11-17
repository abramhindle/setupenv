#!/usr/bin/env bash

VERSION=1.4.0

wget http://downloads.sourceforge.net/project/stxxl/stxxl/1.4.0/stxxl-${VERSION}.tar.gz
tar xvfz stxxl-${VERSION}.tar.gz
mv stxxl-1.4.0 src
cd src/
mkdir build
cd build
cmake ..
make
cd ../..
mkdir bin
cd bin
ln -s ../src/build/lib .
ln -s ../src/include .
