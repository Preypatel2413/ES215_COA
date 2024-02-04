import time
import cProfile
import random

N = 512
profiler = cProfile.Profile()
profiler.enable()

def multiply(a,b):
    return a*b

def matrixMultiplication(A, B):
    start_time_meat = time.time()
    
    result = [[0.0] * N for _ in range(N)]
    for i in range(N):
        for j in range(N):
            for k in range(N):
                # result[i][j] += A[i][k] * B[k][j]
                result[i][j] += multiply(A[i][k], B[k][j])
    
    end_time_meat = time.time()

    return result, end_time_meat - start_time_meat

def random_init(Z):
    for i in range(len(Z)):
        for j in range(len(Z)):
            Z[i][j] = random.randint(0,2147483647)/2147483647

A = [[0.0] * N for _ in range(N)]
B = [[0.0] * N for _ in range(N)]
# Initialize matrices A and B

random_init(A)
random_init(B)


start_time = time.time()
result, meat_execution_time = matrixMultiplication(A, B)
end_time = time.time()

cpu_time = end_time - start_time
process_time = time.process_time()

profiler.disable()

print(f"Matrix multiplication {N} x {N} of float type.")

print("CPU Time:", cpu_time)
print("Process Time:", process_time)
print()

profiler.print_stats()