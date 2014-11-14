#!/usr/bin/env bash
VERSION=3.1.0-rc2

wget http://www.cmake.org/files/v3.1/cmake-${VERSION}-Linux-i386.tar.gz
tar xvfz cmake-${VERSION}-Linux-i386.tar.gz
mkdir ${VERSION}
mv cmake-${VERSION}-Linux-i386 bin
mv bin ${VERSION}/
cp setupenv.sh ${VERSION}
