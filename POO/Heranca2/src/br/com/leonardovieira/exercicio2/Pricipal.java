package br.com.leonardovieira.exercicio2;

public class Pricipal{
    public static void main(String[] args) {
        Cachorro cachorro = new Cachorro("Scooby-Doo", "Fila Brasileiro");
        Gato gato = new Gato("Richardi", "preto");
        cachorro.emitirSom();
        gato.emitirSom();
    }
}
