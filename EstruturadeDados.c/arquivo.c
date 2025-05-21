#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define TAM_NOME 100
#define TAM_FILA 100

// Estrutura para representar a fila
typedef struct {
    char arquivos[TAM_FILA][TAM_NOME];
    int inicio;
    int fim;
} FilaImpressao;

// Inicializa a fila
void inicializarFila(FilaImpressao *fila) {
    fila->inicio = 0;
    fila->fim = 0;
}

// Verifica se a fila está vazia
int filaVazia(FilaImpressao *fila) {
    return fila->inicio == fila->fim;
}

// Verifica se a fila está cheia
int filaCheia(FilaImpressao *fila) {
    return fila->fim == TAM_FILA;
}

// Insere um arquivo na fila
void inserirArquivo(FilaImpressao *fila) {
    if (filaCheia(fila)) {
        printf("A fila de impressao esta cheia!\n");
        return;
    }

    char nomeArquivo[TAM_NOME];
    printf("Digite o nome do arquivo: ");
    getchar(); // limpa o buffer
    fgets(nomeArquivo, TAM_NOME, stdin);
    nomeArquivo[strcspn(nomeArquivo, "\n")] = '\0'; // remove o '\n'

    strcpy(fila->arquivos[fila->fim], nomeArquivo);
    fila->fim++;

    printf("Arquivo \"%s\" inserido na fila.\n", nomeArquivo);
}

// Executa a impressão (remove da fila)
void executarImpressao(FilaImpressao *fila) {
    if (filaVazia(fila)) {
        printf("A fila de impressao esta vazia!\n");
        return;
    }

    printf("Imprimindo arquivo: \"%s\"\n", fila->arquivos[fila->inicio]);
    fila->inicio++;
}

// Exibe os arquivos na fila
void exibirFila(FilaImpressao *fila) {
    if (filaVazia(fila)) {
        printf("A fila de impressao esta vazia!\n");
        return;
    }

    printf("Fila de Impressao:\n");
    for (int i = fila->inicio; i < fila->fim; i++) {
        printf("%d. %s\n", i - fila->inicio + 1, fila->arquivos[i]);
    }
}

int main() {
    FilaImpressao fila;
    inicializarFila(&fila);

    int opcao;

    do {
        printf("\nMenu:\n");
        printf("1 - Inserir arquivo na fila\n");
        printf("2 - Executar impressao\n");
        printf("3 - Exibir fila de impressao\n");
        printf("4 - Fim\n");
        printf("Escolha uma opcao: ");
        scanf("%d", &opcao);

        switch (opcao) {
            case 1:
                inserirArquivo(&fila);
                break;
            case 2:
                executarImpressao(&fila);
                break;
            case 3:
                exibirFila(&fila);
                break;
            case 4:
                printf("Encerrando o programa.\n");
                break;
            default:
                printf("Opcao invalida! Tente novamente.\n");
        }
    } while (opcao != 4);

    return 0;
}

