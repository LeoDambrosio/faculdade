package br.com.guilhermevillaca.antipadroes.estruturais.composite;

// Fardo que contém várias caixas (ex: 6 caixas de 12 leites cada)
public class Fardo {
    private String nome;
    private Caixa caixa;
    private int quantidade;

    public Fardo(String nome, Caixa caixa, int quantidade) {
        this.nome = nome;
        this.caixa = caixa;
        this.quantidade = quantidade;
    }

    public double getPreco() {
        return caixa.getPreco() * quantidade;
    }

    public String getNome() {
        return nome;
    }
}
