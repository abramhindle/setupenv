#!/usr/bin/env bash

WHAT=srilm
VERSION=1.7.1b
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

mkdir -p ${TARGETDIR} || exit 1

echo >&2 "you need some way to download the srilm archive - this can't be done automatically"
exit 1

#scp u@...:/work/speech/tools/srilm-1.7.1b/srilm.tgz srilm-1.7.1b.tar.gz || exit 1

mkdir ${WHAT}-${VERSION} || exit 1
cp ${WHAT}-${VERSION}.tar.gz ${WHAT}-${VERSION} || exit 1
cd ${WHAT}-${VERSION} || exit 1
tar xvfz ${WHAT}-${VERSION}.tar.gz || exit 1
export SRILM=`pwd` || exit 1
make

cp -R include ${TARGETDIR} || exit 1

# they really messed up the usual directory conventions - need some copying tricks
mkdir -p ${TARGETDIR}/bin || exit 1
find ./bin -type f -maxdepth 2 -exec cp {} ${TARGETDIR}/bin/. \;

# same here
mkdir -p ${TARGETDIR}/lib || exit 1
find ./lib -type f -maxdepth 2 -exec cp {} ${TARGETDIR}/lib/. \;

# and here
mkdir -p ${TARGETDIR}/share || exit 1
cp -R man ${TARGETDIR}/share || exit 1
