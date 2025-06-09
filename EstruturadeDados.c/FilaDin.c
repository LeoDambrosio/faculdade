#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define TAM_NOME 100

// Estrutura de um nó da fila (cada arquivo)
typedef struct No {
    char nomeArquivo[TAM_NOME]; // Nome do arquivo
    struct No* prox;            // Ponteiro para o próximo nó
} No;

// Estrutura da fila com ponteiros para início e fim
typedef struct {
    No* inicio; // Primeiro nó da fila
    No* fim;    // Último nó da fila
} Fila;

// Inicializa a fila dinâmica
void inicializarFila(Fila* fila) {
    fila->inicio = NULL;
    fila->fim = NULL;
}

// Verifica se a fila está vazia
int filaVazia(Fila* fila) {
    return fila->inicio == NULL;
}

// Insere novo nó (arquivo) no final da fila
void inserirArquivo(Fila* fila, char nome[]) {
    No* novo = (No*) malloc(sizeof(No)); // Aloca memória para novo nó
    if (novo == NULL) {
        printf("Erro ao alocar memória!\n");
        return;
    }

    strcpy(novo->nomeArquivo, nome); // Copia o nome do arquivo
    novo->prox = NULL;               // Próximo será NULL

    if (filaVazia(fila)) {
        fila->inicio = novo;
        fila->fim = novo;
    } else {
        fila->fim->prox = novo;
        fila->fim = novo;
    }

    printf("Arquivo '%s' adicionado à fila.\n", nome);
}

// Remove o primeiro nó (arquivo) da fila
void executarImpressao(Fila* fila) {
    if (filaVazia(fila)) {
        printf("Fila vazia! Nenhum arquivo para imprimir.\n");
        return;
    }

    No* temp = fila->inicio;
    printf("Imprimindo: %s\n", temp->nomeArquivo);
    fila->inicio = temp->prox;

    if (fila->inicio == NULL) {
        fila->fim = NULL;
    }

    free(temp); // Libera memória
}

// Exibe todos os arquivos da fila
void exibirFila(Fila* fila) {
    if (filaVazia(fila)) {
        printf("Fila vazia!\n");
        return;
    }

    No* atual = fila->inicio;
    int pos = 1;

    printf("Arquivos na fila:\n");
    while (atual != NULL) {
        printf("%d. %s\n", pos, atual->nomeArquivo);
        atual = atual->prox;
        pos++;
    }
}

// Libera toda a memória usada pela fila
void liberarFila(Fila* fila) {
    while (!filaVazia(fila)) {
        executarImpressao(fila);
    }
}

// Programa principal com menu
int main() {
    Fila fila;
    int opcao;
    char nomeArquivo[TAM_NOME];

    inicializarFila(&fila);

    do {
        printf("\nMenu:\n1 - Inserir\n2 - Imprimir\n3 - Exibir\n4 - Sair\nOpcao: ");
        scanf("%d", &opcao);
        getchar(); // Limpa Enter

        switch (opcao) {
            case 1:
                printf("Digite o nome do arquivo: ");
                fgets(nomeArquivo, TAM_NOME, stdin);
                nomeArquivo[strcspn(nomeArquivo, "\n")] = '\0';
                inserirArquivo(&fila, nomeArquivo);
                break;
            case 2:
                executarImpressao(&fila);
                break;
            case 3:
                exibirFila(&fila);
                break;
            case 4:
                liberarFila(&fila);
                printf("Saindo...\n");
                break;
            default:
                printf("Opção inválida!\n");
        }
    } while (opcao != 4);

    return 0;
}