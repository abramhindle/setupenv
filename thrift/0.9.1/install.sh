#!/usr/bin/env bash
wget http://ftp.fau.de/apache/thrift/0.9.1/thrift-0.9.1.tar.gz
tar xvfz thrift-0.9.1.tar.gz
mv thrift-0.9.1 src
cd src

#CXXFLAGS="-std=c++11 -Wreserved-user-defined-literal"
export PY_PREFIX=`realpath ..`/bin
./configure --prefix=`realpath ..`/bin
make -j4
make install
