#include <stdio.h>
#include <string.h>

#define TAM 200       // número máximo de nomes
#define TAM_NOME 100  // tamanho máximo de cada nome

void selectionSort(char v[TAM][TAM_NOME], int n) {
    int i, j, min;
    char aux[TAM_NOME];

    for(i = 0; i < n - 1; i++) {
        min = i;
        for(j = i + 1; j < n; j++) {
            if(strcmp(v[j], v[min]) < 0) {  // comparação alfabética
                min = j;
            }
        }
        // troca v[i] com v[min]
        strcpy(aux, v[i]);
        strcpy(v[i], v[min]);
        strcpy(v[min], aux);
    }
}

int main() {
    char v[TAM][TAM_NOME];
    int n, i;

    printf("Digite o numero de nomes: ");
    scanf("%d", &n);
    getchar(); // limpa o '\n' após o scanf

    printf("Digite os %d nomes:\n", n);
    for(i = 0; i < n; i++) {
        fgets(v[i], TAM_NOME, stdin);
        v[i][strcspn(v[i], "\n")] = '\0'; // remove o '\n' do final
    }

    selectionSort(v, n);

    printf("\n\nNomes ordenados:\n");
    for(i = 0; i < n; i++) {
        printf("%s\n", v[i]);
    }

    return 0;
}
