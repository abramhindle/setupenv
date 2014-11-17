#!/usr/bin/env bash

WHAT=bison
VERSION=3.0
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

wget http://ftp.gnu.org/gnu/bison/bison-${VERSION}.tar.gz

tar xvfz bison-${VERSION}.tar.gz
mv bison-${VERSION} src
mkdir ${VERSION}
mv src ${VERSION}
cd ${VERSION}/src/

./configure --prefix=${TARGETDIR}
make -j4
make install
cd ../..
cp setupenv.sh ${VERSION}
