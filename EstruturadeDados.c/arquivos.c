#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX 100
#define TAM_NOME 100

//Estrutura da fila estatica com array fixo
typedef struct {
    char arquivo[MAX][TAM_NOME];
    int inicio; //indice do primeiro elemento da fila
    int fim; //indice da proxima posicao livre
}Fila;

//Inicializa a fila 
void inicializarFila(Fila * fila) {
    fila-> inicio = 0;
    fila-> fim = 0;
}

//Verificar se a fila esta cheia 
int filaCheia(Fila * fila) {
    return fila->fim ==MAX;
}

//Verificar fila Vazia
int filaVazia(Fila * fila) {
    return fila->inicio == fila->fim;
}

//Insere um nome arquivo na fila
void inserirArquivo(Fila * fila, char nome[]) {
    if (filaCheia(fila)) {
        printf("Fila cheia!\n");
    }
    struct(fila->arquivos[fila->fila], nome);
    fila->fim++;
    printf("Arquivo '%s' adicionado a fila.\n", nome);
}

//Remove o primeiro arquivo da fila 
void executarImpressao(Fila * fila) {
    if (filaVazia(fila)) {
        printf("Fila está vazia!\n");
        return;
    }

    printf("Imprimindo: \"%s\"\n", fila->arquivos[fila->inicio]);
    fila->inicio++;
}

//Mostra todos os arquivos na fila
void exibirFila(Fila * fila) {
    if (filaVazia(fila)) {
        printf("Fila está vazia!\n");
        return;
    }

    printf("Arquivo na fila:\n");
    for (int i = fila->inicio; i < fila->fim; i++) {
        printf("%d. %s\n", i - fila->inicio + 1, fila->arquivos[i]);
    }
}

int main() {
    Fila fila;
    int opcao;
    char nomeArquivo[TAM_NOME];
    inicializarFila(&fila);

    do {
        printf("\nMenu:\n");
        printf("1 - Inserir arquivo na fila\n");
        printf("2 - Executar impressão\n");
        printf("3 - Exibir fila de impressão\n");
        printf("4 - Fim\n");
        printf("Escolha uma opção: ");
        scanf("%d", &opcao);
        getchar(); //Limpar o enter

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
                printf("Opção inválida! Tente novamente.\n");
        }
    } while (opcao != 4);

    return 0;
}
