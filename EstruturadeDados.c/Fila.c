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
        printf("Fila cheia! %s nao pode ser adicionado.\n", nome);
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

void mostrarFila(Fila *f, char time[]) {
    printf("\nFila do Time %s:\n", time);
    if (filaVazia(f)) {
        printf("[Fila vazia]\n");
        return;
    }
    int i = f->inicio;
    for (int c = 0; c < f->total; c++) {
        printf("%d. %s\n", c + 1, f->pessoas[i].nome);
        i = (i + 1) % TAM;
    }
}

void ocuparAssentos(Fila *f, char time[]) {
    printf("\nEntrada do Time %s:\n", time);
    for (int i = 1; i <= TAM; i++) {
        if (!filaVazia(f)) {
            Pessoa p = desenfileirar(f);
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

    int opcao;
    char nome[50];

    do {
        printf("\n--- MENU ---\n");
        printf("1. Adicionar torcedor a Fila A\n");
        printf("2. Adicionar torcedor a Fila B\n");
        printf("3. Mostrar filas A e B\n");
        printf("4. Ocupar assentos e encerrar\n");
        printf("Escolha uma opcao: ");
        scanf("%d", &opcao);
        getchar(); 

        switch (opcao) {
            case 1:
                if (!filaCheia(&filaA)) {
                    printf("Digite o nome do torcedor do Time A: ");
                    fgets(nome, sizeof(nome), stdin);
                    nome[strcspn(nome, "\n")] = '\0'; 
                    enfileirar(&filaA, nome);
                } else {
                    printf("A Fila A ja esta cheia!\n");
                }
                break;
            case 2:
                if (!filaCheia(&filaB)) {
                    printf("Digite o nome do torcedor do Time B: ");
                    fgets(nome, sizeof(nome), stdin);
                    nome[strcspn(nome, "\n")] = '\0';
                    enfileirar(&filaB, nome);
                } else {
                    printf("A Fila B ja esta cheia!\n");
                }
                break;
            case 3:
                mostrarFila(&filaA, "A");
                mostrarFila(&filaB, "B");
                break;
            case 4:
                ocuparAssentos(&filaA, "A");
                ocuparAssentos(&filaB, "B");
                printf("\nPrograma encerrado.\n");
                break;
            default:
                printf("Opcao invalida!\n");
        }

    } while (opcao != 4);

    return 0;
}
