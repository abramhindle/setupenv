#!/usr/bin/env bash

WHAT=libconfig
VERSION=1.5
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

wget -N http://www.hyperrealm.com/libconfig/libconfig-${VERSION}.tar.gz
tar xvfz libconfig-${VERSION}.tar.gz

mv libconfig-${VERSION} ${VERSION}
cd ${VERSION}
./configure --prefix=${TARGETDIR}
make
make install
cd ..
