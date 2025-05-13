package br.com.leonardovieira.exercicio5;

public class Atividade5B {
    abstract class Pessoa {
    String nome;
}

public class Main {
    public static void main(String[] args) {
        Pessoa p = new Pessoa(); // erro aqui
    }
}
}
//A classe Pessoa é abstrata, e classes abstratas não podem ser instanciadas diretamente.
//O código tenta fazer new Pessoa(), o que gera erro de compilação.