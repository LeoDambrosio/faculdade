#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define TAM_NOME 100
#define TAM_PEDIDO 100

typedef struct No {
    int numeroPedido;
    char nomeCliente[TAM_NOME];
    char pedido[TAM_PEDIDO];
    struct No* prox;
} No;

typedef struct {
    No* inicio;
    No* fim;
    int contador; // controla número dos pedidos
} Fila;

// Inicializa a fila
void inicializarFila(Fila* fila) {
    fila->inicio = NULL;
    fila->fim = NULL;
    fila->contador = 1;
}

// Verifica se está vazia
int filaVazia(Fila* fila) {
    return fila->inicio == NULL;
}

// Insere novo pedido
void inserirPedido(Fila* fila, char nome[], char descricao[]) {
    No* novo = (No*) malloc(sizeof(No));
    if (novo == NULL) {
        printf("Erro ao alocar memória!\n");
        return;
    }

    novo->numeroPedido = fila->contador++;
    strcpy(novo->nomeCliente, nome);
    strcpy(novo->pedido, descricao);
    novo->prox = NULL;

    if (filaVazia(fila)) {
        fila->inicio = novo;
        fila->fim = novo;
    } else {
        fila->fim->prox = novo;
        fila->fim = novo;
    }

    printf("Pedido #%d de %s adicionado à fila.\n", novo->numeroPedido, nome);
}

// Executa o pedido (remove da fila)
void executarPedido(Fila* fila) {
    if (filaVazia(fila)) {
        printf("Fila vazia! Nenhum pedido para preparar.\n");
        return;
    }

    No* temp = fila->inicio;
    printf("Preparando Pedido #%d - %s: %s\n", temp->numeroPedido, temp->nomeCliente, temp->pedido);
    fila->inicio = temp->prox;

    if (fila->inicio == NULL) {
        fila->fim = NULL;
    }

    free(temp);
}

// Exibe todos os pedidos na fila
void exibirFila(Fila* fila) {
    if (filaVazia(fila)) {
        printf("Fila vazia!\n");
        return;
    }

    No* atual = fila->inicio;
    printf("Pedidos na fila:\n");
    while (atual != NULL) {
        printf("Pedido #%d - %s: %s\n", atual->numeroPedido, atual->nomeCliente, atual->pedido);
        atual = atual->prox;
    }
}

// Libera toda a memória
void liberarFila(Fila* fila) {
    while (!filaVazia(fila)) {
        executarPedido(fila);
    }
}

// Programa principal
int main() {
    Fila fila;
    int opcao;
    char nomeCliente[TAM_NOME];
    char descricaoPedido[TAM_PEDIDO];

    inicializarFila(&fila);

    do {
        printf("\nMenu:\n1 - Novo Pedido\n2 - Preparar Pedido\n3 - Ver Fila\n4 - Sair\nOpção: ");
        scanf("%d", &opcao);
        getchar(); // limpa enter

        switch (opcao) {
            case 1:
                printf("Nome do cliente: ");
                fgets(nomeCliente, TAM_NOME, stdin);
                nomeCliente[strcspn(nomeCliente, "\n")] = '\0';

                printf("Descrição do pedido: ");
                fgets(descricaoPedido, TAM_PEDIDO, stdin);
                descricaoPedido[strcspn(descricaoPedido, "\n")] = '\0';

                inserirPedido(&fila, nomeCliente, descricaoPedido);
                break;

            case 2:
                executarPedido(&fila);
                break;

            case 3:
                exibirFila(&fila);
                break;

            case 4:
                liberarFila(&fila);
                printf("Encerrando atendimento...\n");
                break;

            default:
                printf("Opção inválida!\n");
        }

    } while (opcao != 4);

    return 0;
}
