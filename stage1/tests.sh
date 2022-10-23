#!/bin/sh
gcc fillB.s -c -o fillB.o
gcc writeArray.s -c -o writeArray.o
gcc readArray.s -c -o readArray.o
gcc genInput.s -c -o genInput.o
gcc main.s -c -o main.o
gcc ./fillB.o ./writeArray.o ./readArray.o ./main.o ./genInput.o -o asm_work.exe

rm -f ./output1.txt
touch ./output1.txt
chmod +x ./output1.txt
./asm_work.exe ./input1.txt ./output1.txt
cat ./output1.txt


rm -f ./output2.txt
touch ./output2.txt
chmod +x ./output2.txt
./asm_work.exe ./input2.txt ./output2.txt
cat ./output2.txt


rm -f ./output3.txt
touch ./output3.txt
chmod +x ./output3.txt
./asm_work.exe ./input3.txt ./output3.txt
cat ./output3.txt