import { Component } from '@angular/core';
import { ProdutoService } from '../produto';
import { NgFor } from '@angular/common';
@Component({
selector: 'app-lista-produto',
templateUrl: './lista-produto.html',
imports: [NgFor]
})
export class ListaProdutos{
produtos: any[] = [];
constructor(private produtoService: ProdutoService) {
this.produtos = this.produtoService.listar();
}
}
