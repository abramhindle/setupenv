#!/usr/bin/env bash

WHAT=word2vec_convert
VERSION=`date +%Y-%m-%d`
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

if [ -d "${TARGETDIR}" ]; then
	echo >&2 "${TARGETDIR} already exists"
	exit 1
fi

git clone https://github.com/marekrei/convertvec.git ${VERSION}
cd ${VERSION}

mkdir -p ${TARGETDIR}/bin

make
cp convertvec ${TARGETDIR}/bin
