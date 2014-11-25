#!/usr/bin/env bash

WHAT=sparsehash
VERSION=2.0.2
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

mkdir -p ${TARGETDIR}

wget https://sparsehash.googlecode.com/files/${WHAT}-${VERSION}.tar.gz
tar xvfz ${WHAT}-${VERSION}.tar.gz
mv ${WHAT}-${VERSION} ${VERSION}

mkdir ${VERSION}-build
cd ${VERSION}-build
cmake ../${VERSION} -DCMAKE_INSTALL_PREFIX=${TARGETDIR}
make install
cd ..
