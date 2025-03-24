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
}

//Multiplicacao de Matrize
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

#include <stdio.h>

int main() {
    int linA, colA, linB, colB;
    
    printf("Digite as dimensoes da matriz A (linhas colunas): ");
    scanf("%d %d", &linA, &colA);
    printf("Digite as dimensoes da matriz B (linhas colunas): ");
    scanf("%d %d", &linB, &colB);
    
    if (colA != linB) {
        printf("Erro: O numero de colunas de A deve ser igual ao numero de linhas de B.\n");
        return 1;
    }
    
    int **A = (int **)malloc(linA * sizeof(int *));
    int **B = (int **)malloc(linB * sizeof(int *));
    int **C = (int **)malloc(linA * sizeof(int *));
    
    for (int i = 0; i < linA; i++) A[i] = (int *)malloc(colA * sizeof(int));
    for (int i = 0; i < linB; i++) B[i] = (int *)malloc(colB * sizeof(int));
    for (int i = 0; i < linA; i++) C[i] = (int *)malloc(colB * sizeof(int));
    
    printf("Digite os elementos da matriz A:\n");
    for (int i = 0; i < linA; i++)
        for (int j = 0; j < colA; j++)
            scanf("%d", &A[i][j]);
    
    printf("Digite os elementos da matriz B:\n");
    for (int i = 0; i < linB; i++)
        for (int j = 0; j < colB; j++)
            scanf("%d", &B[i][j]);
    
    multiplicaMatrizes(A, B, C, linA, colA, colB);
    
    printf("\nResultado da multiplicacao:\n");
    exibeMatriz(C, linA, colB);
    
    for (int i = 0; i < linA; i++) free(A[i]);
    for (int i = 0; i < linB; i++) free(B[i]);
    for (int i = 0; i < linA; i++) free(C[i]);
    free(A); free(B); free(C);
    
    return 0;
}

