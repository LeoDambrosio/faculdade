
#include <stdio.h>

int main() {
   
    int matriz_A[4][4];
    int matriz_B[4][4];
    int matriz_resultado[4][4] = {0};
   
    printf("Digite os valores da matriz A (4x4):\n");
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            printf("Matriz A[%d][%d]: ", i, j);
            scanf("%d", &matriz_A[i][j]);
        }
    }

    printf("\nDigite os valores da matriz B (4x4):\n");
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            printf("Matriz B[%d][%d]: ", i, j);
            scanf("%d", &matriz_B[i][j]);
        }
    }

    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            for (int k = 0; k < 4; k++) {
                matriz_resultado[i][j] += matriz_A[i][k] * matriz_B[k][j];
            }
        }
    }

    printf("\nMatriz Resultante (A x B):\n");
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            printf("%d\t", matriz_resultado[i][j]);
        }
        printf("\n");
    }

    return 0;
}