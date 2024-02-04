#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/times.h>
#include <unistd.h>
#include <time.h>


#define N 512

void initializeRandomMatrix(double matrix[N][N]) {
    srand((unsigned int)time(NULL));

    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            matrix[i][j] = (double)rand() / RAND_MAX;
        }
    }
}

double multiply(double a, double b){
    return a*b;
}

double matrixMultiplication(double A[N][N], double B[N][N], double result[N][N]) {
    double mul_time;
    clock_t s, e;
    s = clock();
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            result[i][j] = 0.0;
            for (int k = 0; k < N; ++k) {
                // result[i][j] += A[i][k] * B[k][j];
                result[i][j] += multiply(A[i][k], B[k][j]);
            }
        }
    }
    e = clock();
    mul_time += (e-s);
    return mul_time;
}

int main() {
    struct tms real_time;
    double multiplication_time;

    double A[N][N], B[N][N], result[N][N];
    
    clock_t s, e;
    s = clock();
    initializeRandomMatrix(A);
    initializeRandomMatrix(B);
    e = clock();
    
    clock_t start, end;
    double cpu_time_used;

    start = clock();
    multiplication_time = matrixMultiplication(A, B, result);
    end = clock();


    cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;

    printf("Matrix multiplication %d x %d of Double type.\n", N, N);
    printf("CPU Time used: %f\n", cpu_time_used);
    

    return 0;
}
