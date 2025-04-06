#include <stdlib.h> /* malloc, free, exit */
#include <stdio.h> /* printf */
#include "matriz.h"

struct matriz {
    int lin;
    int col;
    float* v;
};

Matriz* cria(int m, int n) {
    Matriz* mat = (Matriz*) malloc(sizeof(Matriz));
    if (mat == NULL) {
        printf("Erro: Memória insuficiente para a estrutura da matriz!\n");
        exit(1);
    }

    mat->lin = m;
    mat->col = n;
    mat->v = (float*) malloc(m * n * sizeof(float));
    if (mat->v == NULL) {
        printf("Erro: Memória insuficiente para os valores da matriz!\n");
        free(mat);
        exit(1);
    }

    // Inicializa a matriz com zeros para evitar valores indefinidos
    for (int i = 0; i < m * n; i++) {
        mat->v[i] = 0.0f;
    }

    return mat;
}

void libera(Matriz* mat) {
    if (mat != NULL) {
        free(mat->v);
        free(mat);
    }
}

float acessa(Matriz* mat, int i, int j) {
    if (mat == NULL || mat->v == NULL) {
        printf("Erro: Matriz não inicializada!\n");
        return -1;  // Retorna um valor de erro
    }
    if (i < 0 || i >= mat->lin || j < 0 || j >= mat->col) {
        printf("Erro: Índices fora dos limites!\n");
        return -1;  // Retorna um valor de erro
    }

    return mat->v[i * mat->col + j];
}

void atribui(Matriz* mat, int i, int j, float v) {
    if (mat == NULL || mat->v == NULL) {
        printf("Erro: Matriz não inicializada!\n");
        return;
    }
    if (i < 0 || i >= mat->lin || j < 0 || j >= mat->col) {
        printf("Erro: Índices fora dos limites!\n");
        return;
    }

    mat->v[i * mat->col + j] = v;
}

int linhas(Matriz* mat) {
    return (mat != NULL) ? mat->lin : 0;
}

int colunas(Matriz* mat) {
    return (mat != NULL) ? mat->col : 0;
}
