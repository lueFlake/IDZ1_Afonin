#include <stdio.h>
#include <time.h>

// Объявление двух массивов
int A[10000], B[10000];

extern void readArray(int n, FILE* input);
extern void writeArray(int n, FILE* output);
extern int genInput();
extern void fillB(int n);

int main(int argc, char** argv) {
    int n;
    if (argv[1][0] == '%') {
        n = genInput();
    } else {
        FILE* input = fopen(argv[1], "r");
        fscanf(input, "%d", &n);
        readArray(n, input);
    }
    FILE* output = fopen(argv[2], "w");
    clock_t begin = clock();
    fillB(n);
    clock_t end = clock();
    writeArray(n, output);
    fprintf(output, "\ntime in CLOCKS_PER_SEC: %ld\n", (end - begin));
    return 0;
}