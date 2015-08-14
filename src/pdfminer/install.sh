#!/usr/bin/env bash

WHAT=pdfminer
VERSION=20140328
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}
UNAME=$(uname)
BUILDDIR=`mktemp -d /tmp/build-${WHAT}-${VERSION}-XXXXXXXXXX`

echo >&2 "building in ${BUILDDIR}"

cd ${BUILDDIR}
wget -N https://pypi.python.org/packages/source/p/pdfminer/${WHAT}-${VERSION}.tar.gz || exit 1
tar xfz ${WHAT}-${VERSION}.tar.gz || exit 1
mv ${WHAT}-${VERSION} ${VERSION} || exit 1
cd ${VERSION} || exit1

python setup.py install --prefix=${TARGETDIR}
rm -rf ${BUILDDIR}
