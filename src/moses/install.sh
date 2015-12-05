#!/usr/bin/env bash

WHAT=moses
VERSION=`date +%Y-%m-%d`
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}
BUILDDIR=`mktemp -d /tmp/build-${WHAT}-${VERSION}-XXXXXXXXXX`

echo ${TARGETDIR}

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

mkdir -p ${TARGETDIR}
cd ${BUILDDIR}

git clone https://github.com/moses-smt/mosesdecoder.git

cd mosesdecoder/
./bjam -j32 --prefix=${TARGETDIR}
