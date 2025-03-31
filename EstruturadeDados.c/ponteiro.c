///#include <stdio.h>{

///int main() {
    //int num = 10;
   // int *ptr = &num;

   // printf("Valor antes: %d\n", num);
   // *ptr = 20;  // Modificando o valor de num através do ponteiro
   // printf("Valor depois: %d\n", num);

   // return 0;
//}

#include <stdio.h>
#include <stdlib.h>

int main() {
    int *ptr = (int *)malloc(sizeof(int));  // Aloca memória para um inteiro

    if (ptr == NULL) {
        printf("Erro de alocação de memória\n");
        return 1;
    }

    *ptr = 50;
    printf("Valor armazenado: %d\n", *ptr);

    free(ptr);  // Libera a memória alocada
    return 0;
}