#!/bin/sh

BINTOOLS=./sdk/binutils-2.28/build
SYSROOT=./sdk/sysroot
COMPILER_PATH=$SYSROOT/usr/lib/gcc/arm-linux-gnueabihf/4.9
COMPILER_PATH2=$SYSROOT/usr/lib/arm-linux-gnueabihf
RPI="--target=arm-linux-gnueabihf \
    --sysroot=$SYSROOT \
    -isysroot=$SYSROOT \
    -L${COMPILER_PATH} \
    -L${COMPILER_PATH2} \
    -B${COMPILER_PATH} \
    --gcc-toolchain=$BINTOOLS/bin \
    -fuse-ld=lld\
    -Wno-unused-command-line-argument"
RPI4LD=" \
    --sysroot=$SYSROOT \
    -L${COMPILER_PATH}\
    -L${COMPILER_PATH2}\
    "
C="$BINTOOLS/bin/clang $RPI"
CPP="$BINTOOLS/bin/clang++ $RPI"



# compile this shit

$CPP -c -o main.o main.cpp
$CPP -o main main.o

