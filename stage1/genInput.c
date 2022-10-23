#include <stdio.h>
#include <time.h>
#include <stdlib.h>

extern int A[];

int genInput() {
    srand(time(0));
    int n, i;
    n = rand() % 20;
    for (i = 0; i < n; i++) {
        A[i] = rand() % 100;
    }
    return n;
}