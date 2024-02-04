#include <stdio.h>
#include <time.h>
#include <stdint.h>

#define N 100

double memo_table[N];


double fib_loop_memo(int n){
    if (n<2) {
        memo_table[n] = n;
        return memo_table[n];
    }
    else {
        if(memo_table[n-1]!=0){
            memo_table[n] = memo_table[n-1] + memo_table[n-2];
            return memo_table[n];
        }else{
            double a = 0;
            double b = 1;
            double result = 0;

            for (int i = 2; i <= n; i++) {
                result = a + b;
                a = b;
                b = result;
            }
            memo_table[n] = result;
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
        f = fib_loop_memo(i);
        t = clock() - t;

        printf("fib(%d) = %g \t Time taken: %ld micro seconds\n", i, f, t);
    }
    tt = clock() - tt;
    printf("total time: %ld micro seconds", tt);

    return 0;
}