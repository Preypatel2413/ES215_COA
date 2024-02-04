#include <stdio.h>
#include <time.h>
#include <stdint.h>

#define N 100

double fib_recursion(int n){
    if(n<2){
        return n;
    }else{
        return fib_recursion(n-2) + fib_recursion(n-1);
    }
}

int main(){
    double f = 0;
    clock_t t, tt;

    tt = clock();
    for(int i = 0; i<N; i++){
        t = clock();
        f = fib_recursion(i);
        t = clock() - t;

        printf("fib(%d) = %g \t Time taken: %ld ms\n", i, f, t/1000);
    }
    tt = clock() -tt;
    printf("total time: %ld ms", tt/1000);

    return 0;
}