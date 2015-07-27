#!/usr/bin/env bash

WHAT=boost
VERSION=1.58.0
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}
BUILDDIR=`mktemp -d /tmp/build-${WHAT}-${VERSION}-XXXXXXXXXX`

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

mkdir -p ${TARGETDIR}

cd ${BUILDDIR}

wget http://downloads.sourceforge.net/project/boost/boost/1.58.0/boost_1_58_0.tar.gz
tar xvfz boost_1_58_0.tar.gz
mv boost_1_58_0 ${VERSION}
cd ${VERSION}

./bootstrap.sh --prefix=${TARGETDIR}
./b2 -j4
./b2 install
