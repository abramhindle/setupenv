#!/usr/bin/env bash

WHAT=gawk
VERSION=4.1.1
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

wget -N http://ftp.gnu.org/gnu/gawk/gawk-${VERSION}.tar.gz
tar xvfz gawk-${VERSION}.tar.gz
mv gawk-${VERSION} ${VERSION}
cd ${VERSION}
./configure --prefix=${TARGETDIR}
make
make install
cd ..

rm -vf ${TARGETDIR}/share/info/dir
