package br.com.leonardovieira.exercicio2;

public abstract class Animal {
    String nome;

    public Animal(String nome) {
        this.nome = nome;
    }

    public abstract void emitirSom();
}
