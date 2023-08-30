#!/bin/bash

# HOME path
export HOME=/home/master/kernel

# Compiler environment
export CLANG_PATH=$HOME/clang-neutron/bin
export PATH="$CLANG_PATH:$PATH"
export CROSS_COMPILE=aarch64-linux-gnu-
export CROSS_COMPILE_ARM32=arm-linux-gnueabi-
export KBUILD_BUILD_USER=Master
export KBUILD_BUILD_HOST=CoreX

echo
echo "Setting CoreX defconfig"
echo

make ARCH=arm64 CC=clang LD=ld.lld AR=llvm-ar NM=llvm-nm OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump STRIP=llvm-strip corex_defconfig

echo
echo "Compiling CoreX Kernel"
echo

make ARCH=arm64 CC=clang LD=ld.lld AR=llvm-ar NM=llvm-nm OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump STRIP=llvm-strip -j$(nproc --all) || exit 1
