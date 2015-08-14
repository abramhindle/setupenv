#!/usr/bin/env bash

WHAT=cpplint
VERSION=0.1
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

wget -N http://skylink.dl.sourceforge.net/project/cpplint/C%2B%2B%20Lint%200.x%20releases/cpplint-0.1/cpplint-0.1.tar.gz

tar xvfz ${WHAT}-${VERSION}.tar.gz
mv ${WHAT}-${VERSION} ${VERSION}

cd ${VERSION}
./configure --prefix=${TARGETDIR}
make -j4
make install
cd ../..
