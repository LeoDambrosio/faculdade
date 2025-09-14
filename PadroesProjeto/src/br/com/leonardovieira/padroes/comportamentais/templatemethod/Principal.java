package br.com.leonardovieira.padroes.comportamentais.templatemethod;

public class Principal {

    public static void main(String[] args) {
        Bebida cha = new Cha();
        System.out.println("Preparando Cha:");
        cha.preparar();

        Bebida cafe = new Cafe();
        System.out.println("\nPreparando Cafe:");
        cafe.preparar();
    }
}