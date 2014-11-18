#!/usr/bin/env bash

WHAT=m4
VERSION=1.4.17
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

wget http://ftp.gnu.org/gnu/m4/m4-${VERSION}.tar.gz

tar xvfz m4-${VERSION}.tar.gz
mv m4-${VERSION} src
mkdir ${VERSION}
mv src ${VERSION}
cd ${VERSION}/src

./configure --prefix=${TARGETDIR}
make
make install
cd ../..

rm -vf ${TARGETDIR}/share/info/dir
