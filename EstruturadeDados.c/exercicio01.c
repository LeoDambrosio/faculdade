#include<stdio.h>
#include<conio.h>
int main()
{
int valor[5], i, soma=0 ,media;
for(i=0; i<5; i++)
{
printf("Qual o %do valor?\n ", i+1);
scanf("%d", &valor[i]);
soma=soma+valor[i];
}
printf("A soma vale: %d", soma);
getch();
}
