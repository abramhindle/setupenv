#!/usr/bin/env bash

git clone https://github.com/kpu/kenlm.git src
cd src
./bjam
./bjam install --prefix=../bin
