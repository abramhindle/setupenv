#!/usr/bin/env bash

VERSION=4.1.1
wget http://ftp.gnu.org/gnu/gawk/gawk-${VERSION}.tar.gz
tar xvfz gawk-${VERSION}.tar.gz
mkdir ${VERSION}
cp setupenv.sh ${VERSION}
mv gawk-${VERSION} src
mv src ${VERSION}
cd ${VERSION}/src
./configure --prefix=`realpath ..`/bin
make -j4
make install
cd ../..
