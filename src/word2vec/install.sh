#!/usr/bin/env bash

WHAT=word2vec

svn checkout http://word2vec.googlecode.com/svn/trunk/
VERSION=r`svn info http://word2vec.googlecode.com/svn/trunk/ |grep Revision: |cut -c11-`
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

mv trunk ${VERSION}
cd ${VERSION}

if [ "$(uname)" == "Darwin" ]; then
  touch malloc.h
fi

make

SOURCEDIR=`realpath ${VERSION}`

mkdir -p ${TARGETDIR}/bin

cp -vf {compute-accuracy,distance,word-analogy,word2phrase,word2vec} ${TARGETDIR}/bin
cd ..
