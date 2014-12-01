#!/usr/bin/env bash

WHAT=boost
VERSION=1.57.0
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

mkdir -p ${TARGETDIR}

wget http://downloads.sourceforge.net/project/boost/boost/1.57.0/boost_1_57_0.tar.gz
tar xvfz boost_1_57_0.tar.gz
mv boost_1_57_0 ${VERSION}
cd ${VERSION}

./bootstrap.sh --prefix=${TARGETDIR}
./b2 -j4
./b2 install
