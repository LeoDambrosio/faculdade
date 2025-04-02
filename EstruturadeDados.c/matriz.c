matriz.c

#include <stdlib.h> /* malloc, free, exit */
#include <stdio.h> /* printf */
#include "matriz.h"
struct matriz {
int lin;
int col;
float* v;
};
Matriz* cria (int m, int n) {
Matriz* mat = (Matriz*) malloc(sizeof(Matriz));
if (mat == NULL) {
printf("Memória insuficiente!\n");
exit(1);
}
mat->lin = m;
mat->col = n;
mat->v = (float*) malloc(m*n*sizeof(float));
return mat;
}
void libera (Matriz* mat){
free(mat->v);
free(mat);
}

