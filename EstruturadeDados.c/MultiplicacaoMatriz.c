
#include <stdio.h>

int main() {
   
    int matriz_A[6][6];
    int matriz_B[6][6];
    int matriz_resultado[6][6] = {0};
   
    printf("Digite os valores da matriz A (6x6):\n");
    for (int i = 0; i < 6; i++) {
        for (int j = 0; j < 6; j++) {
            printf("Matriz A[%d][%d]: ", i, j);
            scanf("%d", &matriz_A[i][j]);
        }
    }

    printf("\nDigite os valores da matriz B (6x6):\n");
    for (int i = 0; i < 6; i++) {
        for (int j = 0; j < 6; j++) {
            printf("Matriz B[%d][%d]: ", i, j);
            scanf("%d", &matriz_B[i][j]);
        }
    }

    for (int i = 0; i < 6; i++) {
        for (int j = 0; j < 6; j++) {
            for (int k = 0; k < 6; k++) {
                matriz_resultado[i][j] += matriz_A[i][k] * matriz_B[k][j];
            }
        }
    }

    printf("\nMatriz Resultante (A x B):\n");
    for (int i = 0; i < 6; i++) {
        for (int j = 0; j < 6; j++) {
            printf("%d\t", matriz_resultado[i][j]);
        }
        printf("\n");
    }
}
