package br.com.leonardovieira.poo.exercicio3;

public class PrincipalRetungulo {
    public static void main(String[] args) {
        Retangulo ret = new Retangulo(5, 10);
        System.out.println("Area: " + ret.calcularArea());
        System.out.println("Perimetro: " + ret.calcularPerimetro());
    }
}

