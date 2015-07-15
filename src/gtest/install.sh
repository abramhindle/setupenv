#!/usr/bin/env bash

WHAT=gtest
VERSION=1.7.0
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

wget http://googletest.googlecode.com/files/${WHAT}-${VERSION}.zip
unzip ${WHAT}-${VERSION}.zip
mv ${WHAT}-${VERSION} ${VERSION}
cd ${VERSION}
./configure --prefix=${TARGETDIR}
make
make install

# workaround
cp -R include ${TARGETDIR}
cd ..
