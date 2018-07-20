#!/bin/sh
export CROSS_COMPILE=arm-linux-gnueabihf-
export CC=${CROSS_COMPILE}gcc
export CXX=${CROSS_COMPILE}g++
export LD=${CROSS_COMPILE}ld
export AR=${CROSS_COMPILE}ar
echo CC=$CC
echo CXX=$CXX
echo LD=$LD
$CXX --version

# locate erootfs path for --sysroot
export PROJECT_ROOT=`pwd`
export EROOTFS=${PROJECT_ROOT}/erootfs
export ARMOPTS="-march=armv8-a+crc -mtune=cortex-a53 -mfpu=neon-vfpv4 -mfloat-abi=hard -O3 -ftree-vectorize -fPIC"
export CFLAGS="${ARMOPTS} --sysroot=${EROOTFS}"
export CXXFLAGS="${ARMOPTS} --sysroot=${EROOTFS}"
export LDFLAGS="--sysroot=${EROOTFS}"
echo CFLAGS=$CFLAGS
echo CXXFLAGS=$CXXFLAGS
echo LDFLAGS=$LDFLAGS
