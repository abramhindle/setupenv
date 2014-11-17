#!/usr/bin/env bash

git clone https://github.com/kpu/kenlm.git src
cd src
./bjam -j4
cd ..
mkdir bin
cd bin
ln -s ../src include
ln -s ../src/bin bin
ln -s ../src/lib lib
