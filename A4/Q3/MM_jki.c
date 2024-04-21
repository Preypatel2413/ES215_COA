#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

#define n 400

int main() {

        int i, j, k;
        int a[n][n], b[n][n], M[n][n] ;
        
        struct timeval start, end;
        srand(time(NULL));

        for(i = 0; i < n; i++) {
            for(j = 0; j < n; j++) {
                a[i][j] = rand();
                b[i][j] = rand();
            }
        }
        
        gettimeofday(&start, NULL);
      
        for(j=0;j<n;j++) {    
            for(k=0;k<n;k++) {    
                M[i][j]=0;    
                for(i=0; i<n; i++){    
                    M[i][j]+=a[i][k]*b[k][j];    
                }    
            }    
        }    
        gettimeofday(&end, NULL);
        double time = (end.tv_sec - start.tv_sec) + (end.tv_usec - start.tv_usec) / 1000.0;

        printf("\n");
        printf("In C with combination j k i\n");
        printf("Execution time for (N = %d) is %f ms.\n",n, time);
        printf("\n");
    
	return 0;
}