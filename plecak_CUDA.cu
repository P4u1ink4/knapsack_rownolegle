#include <stdio.h>
#include <stdlib.h>
#include <cuda_runtime.h>
#include <math.h>
#include <cuda.h>

#define MAX_VALUE 10

#define gpuErrchk(ans) { gpuAssert((ans), __FILE__, __LINE__); }
inline void gpuAssert(cudaError_t code, const char *file, int line, bool abort=true)
{
   if (code != cudaSuccess) 
   {
      fprintf(stderr,"GPUassert: %s %s %d\n", cudaGetErrorString(code), file, line);
      if (abort) exit(code);
   }
}

__global__ void dynamic_kernel(int bag, int *items_weight, int *items_val, int n, int *result, int *matrix) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;

    if (idx <= bag) {
        for (int i = 0; i <= n; i++) {
            __syncthreads();
            int currentRow = i % 2;
            int previousRow = (i - 1) % 2;
            if (idx == 0) {
                matrix[(bag+1)*currentRow] = 0;
            }
            else if( i==0 ){
                matrix[idx] = 0;
            }
            else if (idx >= items_weight[i - 1]) {
                int val = matrix[(bag+1)*previousRow + idx - items_weight[i - 1]] + items_val[i - 1];
                matrix[(bag+1)*currentRow + idx] = max(matrix[(bag+1)*previousRow + idx], val);
            }
            else {
                matrix[(bag+1)*currentRow + idx] = matrix[(bag+1)*previousRow + idx];
            }
            __syncthreads();
        }
        if (idx == bag) {
            atomicMax(result, matrix[(bag+1)*(n % 2) + idx]);
        }
    }
}

int dynamic_cuda(int bag, int *items_weight, int *items_val, int n) {
    int *d_items_weight, *d_items_val, *d_result;

    cudaMalloc((void **)&d_items_weight, n * sizeof(int));
    cudaMalloc((void **)&d_items_val, n * sizeof(int));
    cudaMalloc((void **)&d_result, sizeof(int));

    cudaMemcpy(d_items_weight, items_weight, n * sizeof(int), cudaMemcpyHostToDevice);
    cudaMemcpy(d_items_val, items_val, n * sizeof(int), cudaMemcpyHostToDevice);

    int *d_matrix;
    cudaMalloc((void **)&d_matrix, (bag+1) * 2 * sizeof(int));

    int threadsPerBlock = 256;
    int blocksPerGrid = (bag + threadsPerBlock - 1) / threadsPerBlock;

    dynamic_kernel<<<blocksPerGrid, threadsPerBlock>>>(bag, d_items_weight, d_items_val, n, d_result, d_matrix);
    gpuErrchk( cudaPeekAtLastError() );
    gpuErrchk( cudaDeviceSynchronize() );

    int result;
    cudaMemcpy(&result, d_result, sizeof(int), cudaMemcpyDeviceToHost);

    cudaFree(d_items_weight);
    cudaFree(d_items_val);
    cudaFree(d_result);

    return result;
}

void separator(int n, int bag, int *items_weight, int *items_val, int *items_priority) {
    int n_elements_with_priority = 0;
    int max_weight_elements_with_priority = 0;
    int n_elements_without_priority = 0;
    int *first_use_elements_weight = (int *)malloc(n * sizeof(int));
    int *first_use_elements_val = (int *)malloc(n * sizeof(int));
    int *else_elements_weight = (int *)malloc(n * sizeof(int));
    int *else_elements_val = (int *)malloc(n * sizeof(int));
    int max_sum_dynamic = 0;

    for (int i = 0; i < n; i++) {
        if (items_priority[i] == 1) {
            first_use_elements_weight[n_elements_with_priority] = items_weight[i];
            first_use_elements_val[n_elements_with_priority] = items_val[i];
            n_elements_with_priority++;
            max_weight_elements_with_priority += items_weight[i];
            max_sum_dynamic += items_val[i];
        } else {
            else_elements_weight[n_elements_without_priority] = items_weight[i];
            else_elements_val[n_elements_without_priority] = items_val[i];
            n_elements_without_priority++;
        }
    }

    if (max_weight_elements_with_priority <= bag) {
        printf("Przedmioty konieczne w plecaku\n");
        bag -= max_weight_elements_with_priority;
        if(bag>0){
            max_sum_dynamic += dynamic_cuda(bag, else_elements_weight, else_elements_val, n_elements_without_priority);
        }
    } else {
        printf("Nie udalo sie zmiescic wszystkich koniecznych przedmioow w plecaku.\n");
        max_sum_dynamic = dynamic_cuda(bag, items_weight, items_val, n);
    }

    printf("Wynik algorytmu dynamicznego: %d\n", max_sum_dynamic);

    free(first_use_elements_weight);
    free(first_use_elements_val);
    free(else_elements_weight);
    free(else_elements_val);
}

void generator(int n, int bag, int *items_weight, int *items_val, int *items_priority) {
    double start, end;

    start = (double) clock();
    start = start / CLOCKS_PER_SEC;

    separator(n, bag, items_weight, items_val, items_priority);

    end = (double) clock();
    end = end / CLOCKS_PER_SEC;

    printf("Czas wykonania: %f s\n", end - start);
}

int main(int argc, char *argv[]) {

    int n_items = atoi(argv[1]);
    int bag_size = atoi(argv[2]);

    int *items_weight = (int *)malloc(n_items * sizeof(int));
    int *items_val = (int *)malloc(n_items * sizeof(int));
    int *items_priority = (int *)malloc(n_items * sizeof(int));

    for (int j = 0; j < n_items; j++) {
        items_weight[j] = rand() % (bag_size / 2) + 1;
        items_val[j] = rand() % MAX_VALUE + 1;
        items_priority[j] = 0;
        // items_priority[j] = rand() % (n_items / 2 ) == 0 ? 1 : 0;
    }

    generator(n_items, bag_size, items_weight, items_val, items_priority);

    free(items_weight);
    free(items_val);
    free(items_priority);

    return 0;
}
