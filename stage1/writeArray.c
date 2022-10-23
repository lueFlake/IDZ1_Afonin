#include <stdio.h>

extern int B[];

int writeArray(int n, FILE* output) {
    int i;
    for (i = 0; i < n; ++i) {
        fprintf(output, "%d ", B[i]);
    }
}