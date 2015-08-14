#!/usr/bin/env bash

WHAT=tgif
VERSION=4.2.5
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}
BUILDDIR=`mktemp -d /tmp/build-${WHAT}-${VERSION}-XXXXXXXXXX`

echo ${TARGETDIR}

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

mkdir -p ${TARGETDIR}

cd ${BUILDDIR}

wget -N ftp://bourbon.usc.edu/pub/tgif/tgif-QPL-${VERSION}.tar.gz
tar xvfz tgif-QPL-${VERSION}.tar.gz

# needed on mac ... ?
export LDFLAGS="-L/opt/X11/lib/ ${LDFLAGS}"

cd ${WHAT}-QPL-${VERSION}
./configure --prefix=${TARGETDIR}
make
make install
