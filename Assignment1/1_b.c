#include <stdio.h>
#include <time.h>
#include <stdint.h>

#define N 100


double fib_loop(int n){
    if (n < 2) {
        return n;
    }

    double a = 0;
    double b = 1;
    double result = 0;

    for (int i = 2; i <= n; i++) {
        result = a + b;
        a = b;
        b = result;
    }

    return result;
}

int main(){
    double f = 0;
    clock_t t, tt;

    tt = clock();
    for(int i = 0; i<N; i++){
        t = clock();
        f = fib_loop(i);
        t = clock() - t;

        printf("fib(%d) = %g \t Time taken: %ld micro seconds\n", i, f, t);
    }
    tt = clock() -tt;
    printf("total time: %ld micro seconds", tt);

    return 0;
}