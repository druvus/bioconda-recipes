#!/bin/bash
export CFLAGS="-I$PREFIX/include"
export LDFLAGS="-L$PREFIX/lib"
export CPATH=${PREFIX}/include

mkdir -p $PREFIX/bin
mkdir -p $PREFIX/opt/discosnp

mkdir  build
cd build 
cmake ..
make
cd ..
mv ./* $PREFIX/opt/discosnp
ln -s  run_discoSnp++.sh $PREFIX/bin
