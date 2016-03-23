#!/usr/bin/env bash

WHAT=bzip2
VERSION=1.0.6
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

wget -N http://www.bzip.org/${VERSION}/bzip2-${VERSION}.tar.gz

tar xvfz bzip2-${VERSION}.tar.gz
cd bzip2-${VERSION}
make
make PREFIX=${TARGETDIR} install
cd ..
