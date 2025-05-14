package br.com.leonardovieira.exercicio5;

public class Atividade5C {
    abstract class Produto {
    String nome;
    abstract Produto(); // erro aqui
}
}
//Construtores nunca podem ser abstratos. A palavra-chave abstract só pode ser usada em métodos, não em construtores.
//Isso gera erro de compilação.