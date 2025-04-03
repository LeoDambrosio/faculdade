package br.com.leonardovieira.poo.exercicio1;

public class Produto {
    private String nome;
    private double preco;
    private int quantidadeEmEstoque;

    public Produto(String nome, double preco, int quantidadeEmEstoque) {
        this.nome = nome;
        this.preco = preco;
        this.quantidadeEmEstoque = quantidadeEmEstoque;
    }

    public void vender(int quantidade) {
        if (quantidade > this.quantidadeEmEstoque) {
            System.out.println("Estoque insuficiente!");
        } else {
            this.quantidadeEmEstoque -= quantidade;
            System.out.println("Venda realizada! " + quantidade + " unidade(s) vendida(s).");
        }
    }

    public void reporEstoque(int quantidade) {
        this.quantidadeEmEstoque += quantidade;
        System.out.println("Estoque atualizado! " + quantidade + " unidade(s) adicionada(s).");
    }

    public void exibirDetalhes() {
        System.out.println("Produto: " + this.nome);
        System.out.println("Preço: R$" + String.format("%.2f", this.preco));
        System.out.println("Quantidade em Estoque: " + this.quantidadeEmEstoque);
    }

    public static void main(String[] args) {
        Produto produto = new Produto("Notebook", 3500.00, 10);
        produto.exibirDetalhes();
        produto.vender(3);
        produto.exibirDetalhes();
        produto.reporEstoque(5);
        produto.exibirDetalhes();
    }
}
