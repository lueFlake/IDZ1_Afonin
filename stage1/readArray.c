#include <stdio.h>

extern int A[];

int readArray(int n, FILE* input) {
    int i;
    for (i = 0; i < n; ++i) {
        fscanf(input, "%d", &A[i]);
    }
}