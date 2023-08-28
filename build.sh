#!/bin/bash

# HOME path
export HOME=/home/master/kernel

# Compiler environment
export CLANG_PATH=$HOME/clang/bin
export PATH="$CLANG_PATH:/home/master/kernel/aarch64-linux-android-4.9/bin:$PATH"
export CROSS_COMPILE=aarch64-linux-gnu-
export CROSS_COMPILE_ARM32=arm-linux-gnueabi-
export KBUILD_BUILD_USER=Master
export KBUILD_BUILD_HOST=PAK

echo
echo "Setting defconfig"
echo

make ARCH=arm64 \
        CC=clang \
        CLANG_TRIPLE=aarch64-linux-gnu- \
        CROSS_COMPILE=aarch64-linux-android- \
        O=out \
        vendor/sm8150-perf_defconfig

echo
echo "Compiling kernel"
echo

make -j2 O=out \
        ARCH=arm64 \
        CC=clang \
        CLANG_TRIPLE=aarch64-linux-gnu- \
        O=out \
        CROSS_COMPILE=aarch64-linux-android-
