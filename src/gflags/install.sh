#!/usr/bin/env bash

WHAT=gflags
VERSION=`date +%Y-%m-%d`
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

git clone https://code.google.com/p/gflags/
mv gflags ${VERSION}

mkdir ${VERSION}-build

cd ${VERSION}-build
cmake ../${VERSION} -DCMAKE_INSTALL_PREFIX=${TARGETDIR}
make install

# we additionally need to copy this dir
cp -R include ${TARGETDIR}
cd ..
