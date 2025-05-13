package br.com.leonardovieira.exercicio5;

public class Atividade5A {
    abstract class Veiculo {
    String marca;
    abstract void acelerar();
}

class Carro extends Veiculo {
    // não implementou o método acelerar()
}
}

//Carro não é abstrata, ela é obrigada a implementar todos os métodos abstratos da classe pai.
//Como isso não foi feito, o código não compila.