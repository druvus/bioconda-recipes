#!/bin/bash

#strictly use anaconda build environment
CC=${PREFIX}/bin/gcc
CXX=${PREFIX}/bin/g++

mkdir -p $PREFIX/bin

make fermi.kit/run-calling
mv fermi.kit/run-calling  $PREFIX/bin
