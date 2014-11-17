#!/usr/bin/env bash
svn checkout http://word2vec.googlecode.com/svn/trunk/
REVISION=r`svn info http://word2vec.googlecode.com/svn/trunk/ |grep Revision: |cut -c11-`
mv trunk src
mkdir ${REVISION}
mv src ${REVISION}
cd ${REVISION}/src
make
cd ../..
cp setupenv.sh ${REVISION}
