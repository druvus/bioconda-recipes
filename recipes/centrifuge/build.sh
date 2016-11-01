#!/bin/bash

mkdir -p $PREFIX/bin

make
make install prefix=$PREFIX
