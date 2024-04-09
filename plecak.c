#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

#define MAX_VALUE 10

int dynamic(int bag, int items_weight[], int items_val[], int n);
void separator(int n, int bag, int items_weight[], int items_val[], int items_priority[]);
void generator(int n, int bag, int items_weight[], int items_val[], int items_priority[]);

int main() {
    // int n_items[6] = {5000,10000,15000,20000,25000,30000};
    // int bag_sizes[6] = {10000,10000,10000,10000,10000,10000};

    int n_items = 10000;
    int bag_size = 500;

    int *items_weight = (int *)malloc(n_items * sizeof(int));
    int *items_val = (int *)malloc(n_items * sizeof(int));
    int *items_priority = (int *)malloc(n_items * sizeof(int));

    for (int j = 0; j < n_items; j++) {
        items_weight[j] = rand() % (bag_size / 2) + 1;
        items_val[j] = rand() % MAX_VALUE + 1;
        items_priority[j] = 0;
        // items_priority[j] = rand() % (n_items / 2 ) == 0 ? 1 : 0;
    }

    generator(n_items,bag_size,items_weight,items_val,items_priority);
    return 0;
}

int dynamic(int bag, int items_weight[], int items_val[], int n) {
    int **matrix = (int **)malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        matrix[i] = (int *)malloc((bag + 1) * sizeof(int));
    }

    for (int i = 0; i <= n; i++) {
        for (int j = 0; j <= bag; j++) {
            if (i == 0 || j == 0)
                matrix[i][j] = 0;
            else if (items_weight[i - 1] <= j)
                matrix[i][j] = fmax(matrix[i - 1][j], matrix[i - 1][j - items_weight[i - 1]] + items_val[i - 1]);
            else
                matrix[i][j] = matrix[i - 1][j];
        }
    }

    for (int i = 0; i <= n; i++) {
        free(matrix[i]);
    }
    free(matrix);

    return matrix[n][bag];
}

void separator(int n, int bag, int items_weight[], int items_val[], int items_priority[]) {
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
        max_sum_dynamic += dynamic(bag, else_elements_weight, else_elements_val, n_elements_without_priority);
    } else {
        printf("Nie udalo zmiescic sie wszystkich koniecznych przedmiotow w plecaku.\n");
        max_sum_dynamic = dynamic(bag, items_weight, items_val, n);
    }

    printf("Wynik algorytmu dynamicznego: %d\n", max_sum_dynamic);

    free(first_use_elements_weight);
    free(first_use_elements_val);
    free(else_elements_weight);
    free(else_elements_val);
}

void generator(int n, int bag, int items_weight[], int items_val[], int items_priority[]) {
    double start, end;

    start = (double) clock();
    start = start / CLOCKS_PER_SEC;
    
    separator(n, bag, items_weight, items_val, items_priority); 
    
    end = (double) clock();
    end = end / CLOCKS_PER_SEC;
    
    printf("Czas wykonania: %f s\n", end - start);
}
