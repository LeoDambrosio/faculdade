#include <stdio.h>

void Exercicio(int *V, int N) {
    int i, continua, aux, fim = N;

    do {
        continua = 0; 
        for(i = 0; i < fim - 1; i++) {
            if(V[i] > V[i+1]) {
                aux = V[i];
                V[i] = V[i+1];
                V[i+1] = aux;
                continua = 1; 
            }
        }
        fim--;
    } while(continua != 0);
}

int main() {
    int vetor[10] = {34, 12, 5, 66, 2, 89, 7, 45, 23, 10};
    int i;

    printf("Vetor original:\n");
    for(i = 0; i < 10; i++) {
        printf("%d ", vetor[i]);
    }

    bubbleSort(vetor, 10); 

    printf("\n\nVetor ordenado com Bubble Sort:\n");
    for(i = 0; i < 10; i++) {
        printf("%d ", vetor[i]);
    }

    printf("\n");
    return 0;
}
