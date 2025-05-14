package br.com.leonardovieira.exercicio2;

public class Gato extends Animal {
    String cor;

    public Gato(String nome, String cor) {
        super(nome);
        this.cor = cor;
    }

    @Override
    public void emitirSom() {
        System.out.println(nome + " (cor: " + cor + ") diz: Miau!");
    }
}

