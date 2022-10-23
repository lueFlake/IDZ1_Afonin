extern int A[];
extern int B[];

void fillB(int n) {
    int i;
    for (i = 0; i < n; ++i) {
        B[i] = A[i] * A[i];
    }
}