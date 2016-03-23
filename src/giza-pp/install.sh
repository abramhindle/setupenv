#!/usr/bin/env bash

WHAT=giza-pp
VERSION=1.0.7
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

wget http://giza-pp.googlecode.com/files/${WHAT}-v${VERSION}.tar.gz

tar xvfz ${WHAT}-v${VERSION}.tar.gz
mv giza-pp ${VERSION}
cd ${VERSION}

make -j8

mkdir -p ${TARGETDIR}/bin
cp mkcls-v2/mkcls ${TARGETDIR}/bin
cp GIZA++-v2/*.out ${TARGETDIR}/bin
cp GIZA++-v2/GIZA++ ${TARGETDIR}/bin
