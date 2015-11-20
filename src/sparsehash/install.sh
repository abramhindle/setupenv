#!/usr/bin/env bash

WHAT=sparsehash
VERSION=2.0.3
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

mkdir -p ${TARGETDIR}

git clone https://github.com/sparsehash/sparsehash.git
cd sparsehash
git tag -l
git checkout tags/sparsehash-${VERSION}

./configure --prefix=${TARGETDIR}
make
make install
cd ..
