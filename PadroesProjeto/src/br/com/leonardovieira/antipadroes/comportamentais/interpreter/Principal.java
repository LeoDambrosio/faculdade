package br.com.leonardovieira.antipadroes.comportamentais.interpreter;

public class Principal {

    public static void main(String[] args) {
        Interpretador interpretador = new Interpretador();
        System.out.println(interpretador.interpretar("10 + 5")); // 15
        System.out.println(interpretador.interpretar("20 - 8")); // 12
    }

}
