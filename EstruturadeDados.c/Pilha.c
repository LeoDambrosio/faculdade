#include <stdio.h>

// Variável global para contar os movimentos
int movimentos = 0;

void hanoi(int n, char origem, char destino, char auxiliar) {
    // Se sobrar apenas o disco 1, mover e retornar
    if (n == 1) {
        printf("\nMova o disco 1 da base %c para a base %c", origem, destino);
        movimentos++;
        return;
    }
    // Mover os n-1 discos da origem para o auxiliar
    hanoi(n - 1, origem, auxiliar, destino);

    // Mover o disco restante para o destino
    printf("\nMova o disco %d da base %c para a base %c", n, origem, destino);
    movimentos++;

    // Mover os n-1 discos do auxiliar para o destino
    hanoi(n - 1, auxiliar, destino, origem);
}

int main() {
    int n;
    printf("Digite o numero de discos: ");
    scanf("%d", &n);

    printf("Para resolver a torre de Hanoi faca:\n\n");
    hanoi(n, 'A', 'C', 'B');

    printf("\n\nTotal de movimentos: %d\n", movimentos);

    return 0;
}
