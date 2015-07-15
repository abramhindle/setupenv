#!/usr/bin/env bash

WHAT=libjudy
VERSION=1.0.5
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

wget http://garr.dl.sourceforge.net/project/judy/judy/Judy-1.0.5/Judy-1.0.5.tar.gz
tar xvfz Judy-${VERSION}.tar.gz

mv judy-${VERSION} ${VERSION}
cd ${VERSION}

./configure \
  --prefix=${TARGETDIR}

make
make install
cd ..
