#!/usr/bin/env bash
#git clone https://code.google.com/p/gflags/
mv gflags src
REVISION=`cat src/.git/refs/heads/master`
mkdir ${REVISION}
mv src ${REVISION}
cd ${REVISION}
mkdir bin
cd bin
cmake ../src
cd ../..
cp setupenv ${REVISION}

#REVISION=r`svn info http://word2vec.googlecode.com/svn/trunk/ |grep Revision: |cut -c11-`
#mv trunk src
#mkdir ${REVISION}
#mv src ${REVISION}
#cd ${REVISION}/src
#make
#cd ../..
#cp setupenv.sh ${REVISION}
