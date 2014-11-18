#!/usr/bin/env bash

WHAT=bison
VERSION=3.0
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

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
