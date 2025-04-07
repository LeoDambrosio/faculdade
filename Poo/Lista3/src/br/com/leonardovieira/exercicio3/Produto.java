package Lista3.src.br.com.leonardovieira.exercicio3;

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
        System.out.println("Preco: R$" + String.format("%.2f", this.preco));
        System.out.println("Quantidade em Estoque: " + this.quantidadeEmEstoque);
    }
}
