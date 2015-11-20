#!/usr/bin/env bash

WHAT=gdb
VERSION=7.9
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}
UNAME=$(uname)
BUILDDIR=`mktemp -d /tmp/build-${WHAT}-${VERSION}-XXXXXXXXXX`
THREADS=1

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

echo >&2 "building in ${BUILDDIR}"
cd ${BUILDDIR}
wget -N ftp://ftp.gnu.org/gnu/gdb/gdb-${VERSION}.tar.gz || exit 1
tar xfz gdb-${VERSION}.tar.gz || exit 1
mv gdb-${VERSION} ${VERSION} || exit 1
cd ${VERSION} || exit1

configure --prefix=${TARGETDIR}
make
make install
