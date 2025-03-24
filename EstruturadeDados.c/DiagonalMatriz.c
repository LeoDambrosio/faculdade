#include <stdio.h>

int main() {
    // Definindo as matrizes 4x4
    int matriz_A[4][4];
    int matriz_B[4][4];
    int matriz_resultado[4][4] = {0}; // Matriz para armazenar o resultado

    // Solicita ao usuário os valores da matriz A
    printf("Digite os valores da matriz A (4x4):\n");
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            printf("Matriz A[%d][%d]: ", i, j);
            scanf("%d", &matriz_A[i][j]);
        }
    }

    // Solicita ao usuário os valores da matriz B
    printf("\nDigite os valores da matriz B (4x4):\n");
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            printf("Matriz B[%d][%d]: ", i, j);
            scanf("%d", &matriz_B[i][j]);
        }
    }

    // Multiplicando as matrizes
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            for (int k = 0; k < 4; k++) {
                matriz_resultado[i][j] += matriz_A[i][k] * matriz_B[k][j];
            }
        }
    }

    // Exibindo o resultado
    printf("\nMatriz Resultante (A x B):\n");
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            printf("%d\t", matriz_resultado[i][j]);
        }
        printf("\n");
    }

    return 0;
}