#include <stdio.h>
#include <time.h>
#include <stdint.h>

#define N 100

double memo_table[N];

double fib_recursion(int n){
    if(n<2){
        return n;
    }else{
        return fib_recursion(n-2) + fib_recursion(n-1);
    }
}

double fib_recursion_memo(int n){
    if(memo_table[n] != 0){
        return memo_table[n];
    }else{
        if(n<2){
            memo_table[n] = n;
            return memo_table[n];
        }else{
            memo_table[n] = fib_recursion_memo(n-1) + fib_recursion_memo(n-2);
            return memo_table[n];
        }
    }
}

int main(){
    double f = 0;
    clock_t t, tt;

    tt = clock();
    for(int i = 0; i<N; i++){
        t = clock();
        f = fib_recursion_memo(i);
        t = clock() - t;

        printf("fib(%d) = %g \t Time taken: %ld micro seconds\n", i, f, t);
    }
    tt = clock() -tt;
    printf("total time: %ld micro seconds", tt);

    return 0;
}