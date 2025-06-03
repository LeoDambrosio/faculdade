#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define TAM 10

typedef struct {
    char nome[50];
} Pessoa;

typedef struct {
    Pessoa pessoas[TAM];
    int inicio, fim, total;
} Fila;

void inicializarFila(Fila *f) {
    f->inicio = f->fim = f->total = 0;
}

int filaCheia(Fila *f) {
    return f->total == TAM;
}

int filaVazia(Fila *f) {
    return f->total == 0;
}

void enfileirar(Fila *f, char nome[]) {
    if (filaCheia(f)) {
        printf("Fila cheia! %s não pode entrar agora.\n", nome);
        return;
    }
    strcpy(f->pessoas[f->fim].nome, nome);
    f->fim = (f->fim + 1) % TAM;
    f->total++;
}

Pessoa desenfileirar(Fila *f) {
    Pessoa p = {"Ninguem"};
    if (filaVazia(f)) return p;
    p = f->pessoas[f->inicio];
    f->inicio = (f->inicio + 1) % TAM;
    f->total--;
    return p;
}

void ocuparAssentos(Fila *fila, char time[]) {
    printf("\nEntrada do Time %s:\n", time);
    for (int i = 1; i <= TAM; i++) {
        if (!filaVazia(fila)) {
            Pessoa p = desenfileirar(fila);
            printf("Assento %d -> %s\n", i, p.nome);
        } else {
            printf("Assento %d -> Vazio\n", i);
        }
    }
}

int main() {
    Fila filaA, filaB;
    inicializarFila(&filaA);
    inicializarFila(&filaB);

    enfileirar(&filaA, "Ana");
    enfileirar(&filaA, "Carlos");
    enfileirar(&filaA, "Beatriz");
    enfileirar(&filaA, "Daniel");
    enfileirar(&filaA, "Sofia");
    enfileirar(&filaA, "Henrique");
    enfileirar(&filaA, "Larissa");
    enfileirar(&filaA, "Matheus");
    enfileirar(&filaA, "Juliana");
    enfileirar(&filaA, "Rafael");

    enfileirar(&filaB, "Joao");
    enfileirar(&filaB, "Fernanda");
    enfileirar(&filaB, "Ricardo");
    enfileirar(&filaB, "Laura");
    enfileirar(&filaB, "Pedro");
    enfileirar(&filaB, "Camila");
    enfileirar(&filaB, "Bruno");
    enfileirar(&filaB, "Mariana");
    enfileirar(&filaB, "Gustavo");
    enfileirar(&filaB, "Isabela");

    ocuparAssentos(&filaA, "A");
    ocuparAssentos(&filaB, "B");

    return 0;
}
