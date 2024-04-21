import numpy
import time

n= 400
a = numpy.random.randint(50, size=(n,n))
b = numpy.random.randint(50, size=(n,n))

M = a*0
t = time.time()
for k in range (n) :
    for j in range(n):
        for i in range (n):
            M[i][j] +=(a[i][k] * b[k][j])
            

print()
print("In Python with combination k j i")
print (n,"n : Execution time in seconds : ","{:.3f}".format(time.time() - t))
print()