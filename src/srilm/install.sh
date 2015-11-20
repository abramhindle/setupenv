#!/usr/bin/env bash

WHAT=srilm
VERSION=1.7.0
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

echo >&2 "EXPECTING YOU DOWNLOADED AND STORED SRILM AS ${WHAT}-${VERSION}.tar.gz"
echo >&2 "GET IT HERE: http://www.speech.sri.com/projects/srilm/"

mkdir ${VERSION}
cp ${WHAT}-${VERSION}.tar.gz ${VERSION}
cd ${VERSION}

tar xvfz ${WHAT}-${VERSION}.tar.gz

echo >&2 "this isn't automated at all ... edit the Makefile, copy files to target dir ${TARGETDIR}"

mkdir -p ${TARGETDIR}/bin
cp -vR ${VERSION}/bin/i686-m64/* ${TARGETDIR}/bin

exit 1
