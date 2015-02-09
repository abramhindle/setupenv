#!/usr/bin/env bash

WHAT=python-gflags
VERSION=2.0
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}
PYTHONVERSION=2.6

wget https://python-gflags.googlecode.com/files/${WHAT}-${VERSION}.tar.gz || exit 1

tar xvf ${WHAT}-${VERSION}.tar.gz || exit 1
mv ${WHAT}-${VERSION} ${VERSION} || exit 1
cd ${VERSION} || exit 1

mkdir -p ${TARGETDIR}/lib/python${PYTHONVERSION}/site-packages/ || exit 1
python setup.py install --prefix=${TARGETDIR} || exit 1
