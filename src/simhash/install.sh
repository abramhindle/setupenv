#!/usr/bin/env bash

WHAT=simhash
VERSION=`date +%Y-%m-%d`
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

git clone https://github.com/seomoz/simhash-cpp ${VERSION}
cd ${VERSION}

return 1
./configure \
  --prefix=${TARGETDIR}

make
make install
cd ..
