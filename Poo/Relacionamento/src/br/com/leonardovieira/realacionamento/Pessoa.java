package br.com.leonardovieira.realacionamento;

public class Pessoa {

    private String nome;

    public Pessoa(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return this.nome;
    }

    String getNome() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

}
