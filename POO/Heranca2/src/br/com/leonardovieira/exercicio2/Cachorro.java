package br.com.leonardovieira.exercicio2;

public class Cachorro extends Animal {
    String raca;

    public Cachorro(String nome, String raca) {
        super(nome);
        this.raca = raca;
    }

    @Override
    public void emitirSom() {
        System.out.println(nome + " (raça: " + raca + ") diz: Latido!");
    }
}

