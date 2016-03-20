#!/usr/bin/env bash

WHAT=s3cmd
VERSION=1.5.0-alpha1
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}
UNAME=$(uname)
BUILDDIR=`mktemp -d /tmp/build-${WHAT}-${VERSION}-XXXXXXXXXX`

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

echo >&2 "building in ${BUILDDIR}"

cd ${BUILDDIR}
wget http://downloads.sourceforge.net/project/s3tools/s3cmd/1.5.0-alpha1/${WHAT}-${VERSION}.tar.gz || exit 1
tar xvf ${WHAT}-${VERSION}.tar.gz || exit 1
mv ${WHAT}-${VERSION} ${VERSION} || exit 1
cd ${VERSION} || exit1

python setup.py install --prefix=${TARGETDIR}

rm -rf ${BUILDDIR}
