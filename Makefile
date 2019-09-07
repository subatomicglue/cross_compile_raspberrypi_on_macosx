
##########################
# setup for raspberry pi
##########################
SDK=${HOME}/RPI_SDK
BINTOOLS=${SDK}/binutils-2.28/build
SYSROOT=${SDK}/sysroot

COMPILER_PATH=${SYSROOT}/usr/lib/gcc/arm-linux-gnueabihf/4.9
COMPILER_PATH2=${SYSROOT}/usr/lib/arm-linux-gnueabihf

COMPILEFLAGS=--target=arm-linux-gnueabihf \
    --sysroot=${SYSROOT} \
    -isystem=${SYSROOT} \
    -isystem=${SYSROOT}/usr/include/c++/4.9 \
    -isystem=${SYSROOT}/usr/include/arm-linux-gnueabihf/c++/4.9 \
    -B${COMPILER_PATH} \
    --gcc-toolchain=${BINTOOLS}/bin
LINKFLAGS=--target=arm-linux-gnueabihf \
    --sysroot=${SYSROOT} \
    -L${COMPILER_PATH} \
    -L${COMPILER_PATH2} \
    -fuse-ld=lld

C=${BINTOOLS}/bin/clang ${COMPILEFLAGS}
CPP=${BINTOOLS}/bin/clang++ ${COMPILEFLAGS}
C_LD=${BINTOOLS}/bin/clang ${LINKFLAGS}
CPP_LD=${BINTOOLS}/bin/clang++ ${LINKFLAGS}


all:
	${CPP} -c -o main.o main.cpp
	${CPP_LD} -o main main.o

clean:
	rm main main.o

