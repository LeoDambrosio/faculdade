#include <stdio.h>
#include <stdlib.h>

// Função para multiplicação de matrizes
void multiplicaMatrizes(int **A, int **B, int **C, int linA, int colA, int colB) {
    for (int i = 0; i < linA; i++)
        for (int j = 0; j < colB; j++) {
            C[i][j] = 0;
            for (int k = 0; k < colA; k++)
                C[i][j] += A[i][k] * B[k][j];
        }
}

// Função para exibir a matriz
void exibeMatriz(int **M, int linhas, int colunas) {
    for (int i = 0; i < linhas; i++) {
        for (int j = 0; j < colunas; j++)
            printf("%4d ", M[i][j]);
        printf("\n");
    }
}

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