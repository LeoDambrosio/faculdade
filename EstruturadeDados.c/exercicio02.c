#include <stdio.h>
#include <stdlib.h>

int main() {
    int valores[10], i, referencia, maiores = 0, menores = 0, iguais = 0;

    for (i = 0; i < 10; i++) {
        printf("Digite o valor %d: ", i + 1);
        scanf("%d", &valores[i]);
    }

    printf("\nDigite o valor de referencia: ");
    scanf("%d", &referencia);

    for (i = 0; i < 10; i++) {
        if (valores[i] > referencia)
            maiores++;
        else if (valores[i] < referencia)
            menores++;
        else
            iguais++;
    }

    if (maiores > 0) {
        printf("\nOs valores maiores que a referencia sao:\n");
        for (i = 0; i < 10; i++) {
            if (valores[i] > referencia)
                printf("%d\n", valores[i]);
        }
    }
    else {
        printf("\nNao existem valores maiores que a referencia.\n");
    }
    printf("\nExistem %d valores menores que a referencia.\n", menores);
    printf("Existem %d valores iguais a referencia.\n", iguais);

    return 0;
}
