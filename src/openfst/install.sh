#!/usr/bin/env bash

WHAT=openfst
VERSION=1.5.0
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}
BUILDDIR=`mktemp -d /tmp/build-${WHAT}-${VERSION}-XXXXXXXXXX`

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

cp compat.h ${BUILDDIR}

cd ${BUILDDIR}

wget http://www.openfst.org/twiki/pub/FST/FstDownload/openfst-${VERSION}.tar.gz
tar xvfz openfst-${VERSION}.tar.gz

mv openfst-${VERSION} ${VERSION}
cd ${VERSION}
# modified this line to compile on mac, check if still works on linux
#./configure LDFLAGS=-Wl,--no-as-needed --prefix=${TARGETDIR}
./configure --prefix=${TARGETDIR}
make
make install
cd ..

cp -vf compat.h ${BUILDDIR}/include/fst
