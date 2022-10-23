#!/bin/sh
gcc fillB.s -c -o fillB.o
gcc writeArray.s -c -o writeArray.o
gcc readArray.s -c -o readArray.o
gcc genInput.s -c -o genInput.o
gcc main.s -c -o main.o
gcc ./fillB.o ./writeArray.o ./readArray.o ./main.o ./genInput.o -o asm_work.exe
rm -f ./output.txt
touch ./output.txt
chmod +x ./output.txt
./asm_work.exe ./input1.txt ./output.txt
cat ./output.txt