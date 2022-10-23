#!/bin/sh
fileName=$1
gcc -masm=intel \
    -fno-asynchronous-unwind-tables \
    -fno-jump-tables \
    -fno-stack-protector \
    -fno-exceptions \
    ./${fileName}.c \
    -S -o ./${fileName}.s