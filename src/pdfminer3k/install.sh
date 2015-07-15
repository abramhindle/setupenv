#!/usr/bin/env bash

WHAT=pdfminer3k
VERSION=1.3.0
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}
UNAME=$(uname)
BUILDDIR=`mktemp -d /tmp/build-${WHAT}-${VERSION}-XXXXXXXXXX`


echo >&2 "building in ${BUILDDIR}"

echo >&2 "setting python path so that install will not fail"
export PYTHONPATH=${TARGETDIR}/lib/python2.7/site-packages:${PYTHONPATH}
cd ${BUILDDIR}
wget https://pypi.python.org/packages/source/p/pdfminer3k/${WHAT}-${VERSION}.tar.gz || exit 1
tar xfz ${WHAT}-${VERSION}.tar.gz || exit 1
mv ${WHAT}-${VERSION} ${VERSION} || exit 1
cd ${VERSION} || exit1

python setup.py install --prefix=${TARGETDIR}
rm -rf ${BUILDDIR}
