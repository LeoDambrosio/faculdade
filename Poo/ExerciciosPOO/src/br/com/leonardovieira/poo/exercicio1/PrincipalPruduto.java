package br.com.leonardovieira.poo.exercicio1;

public class PrincipalPruduto{

    public static void main(String[] args) {
        Produto produto = new Produto("Notebook", 3500.00, 10);
        produto.exibirDetalhes();
        produto.vender(3);
        produto.exibirDetalhes();
        produto.reporEstoque(5);
        produto.exibirDetalhes();
    }
}

