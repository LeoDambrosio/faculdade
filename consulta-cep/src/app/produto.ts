import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class ProdutoService {
listar() {
  return [
      { nome: 'Notebook', preco: 4500 },
      { nome: 'Mouse', preco: 80 },
      { nome: 'Teclado', preco: 150 },
      { nome: 'Cadeira Gamer', preco: 800 }
    ];
 }
}