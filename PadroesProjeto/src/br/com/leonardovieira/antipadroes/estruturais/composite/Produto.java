package br.com.guilhermevillaca.antipadroes.estruturais.composite;

// Produto individual (ex: 1 litro de leite)
public class Produto {
    private String nome;
    private double preco;

    public Produto(String nome, double preco) {
        this.nome = nome;
        this.preco = preco;
    }

    public double getPreco() {
        return preco;
    }

    public String getNome() {
        return nome;
    }
}




