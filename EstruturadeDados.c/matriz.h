#ifndef MATRIZ_H
#define MATRIZ_H

/* TAD: matriz m por n */
typedef struct matriz Matriz;

/* Função cria
** Aloca e retorna uma matriz de dimensão m por n.
*/
Matriz* cria(int m, int n);

/* Função libera
** Libera a memória de uma matriz previamente criada.
*/
void libera(Matriz* mat);

/* Função acessa
** Retorna o valor do elemento da linha i e coluna j da matriz.
*/
float acessa(const Matriz* mat, int i, int j);

/* Função atribui
** Atribui o valor dado ao elemento da linha i e coluna j da matriz.
*/
void atribui(Matriz* mat, int i, int j, float v);

/* Função linhas
** Retorna o número de linhas da matriz.
*/
int linhas(const Matriz* mat);

/* Função colunas
** Retorna o número de colunas da matriz.
*/
int colunas(const Matriz* mat);

#endif /* MATRIZ_H */
