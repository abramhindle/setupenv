#!/usr/bin/env bash

VERSION=3.0

wget http://ftp.gnu.org/gnu/bison/bison-${VERSION}.tar.gz

tar xvfz bison-${VERSION}.tar.gz
mv bison-${VERSION} src
mkdir ${VERSION}
mv src ${VERSION}
cd ${VERSION}/src/

./configure --prefix=`realpath ..`/bin
make -j4
make install
cd ../..
cp setupenv.sh ${VERSION}
