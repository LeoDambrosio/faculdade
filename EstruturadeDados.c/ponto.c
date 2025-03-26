#include <stdio.h>

// Definindo a estrutura Ponto para armazenar as coordenadas X e Y
struct Ponto {
    int x;
    int y;
};

// Função para exibir os pontos armazenados
void exibirPontos(struct Ponto pontos[], int n) {
    for (int i = 0; i < n; i++) {
        printf("Ponto %d: X = %d, Y = %d\n", i+1, pontos[i].x, pontos[i].y);
    }
}

// Função para adicionar um novo ponto à tabela de pontos
void adicionarPonto(struct Ponto pontos[], int *n, int x, int y) {
    pontos[*n].x = x;
    pontos[*n].y = y;
    (*n)++;
}

int main() {
    // Tamanho máximo para o array de pontos
    int maxPontos = 10;

    // Criando um array para armazenar os pontos
    struct Ponto pontos[maxPontos];

    // Número de pontos atualmente armazenados
    int numPontos = 0;

    // Adicionando alguns pontos à tabela
    adicionarPonto(pontos, &numPontos, 1, 2);
    adicionarPonto(pontos, &numPontos, 3, 4);
    adicionarPonto(pontos, &numPontos, 5, 6);

    // Exibindo os pontos armazenados
    printf("Pontos atuais:\n");
    exibirPontos(pontos, numPontos);

    // Adicionando mais um ponto
    adicionarPonto(pontos, &numPontos, 7, 8);

    // Exibindo os pontos após a adição
    printf("\nApós adicionar um novo ponto:\n");
    exibirPontos(pontos, numPontos);

    return 0;
}
