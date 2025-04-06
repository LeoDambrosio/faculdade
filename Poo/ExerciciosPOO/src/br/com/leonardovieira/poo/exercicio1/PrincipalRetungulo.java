package br.com.leonardovieira.poo.exercicio1;

public class PrincipalRetungulo {
    public static void main(String[] args) {
        Retangulo ret = new Retangulo(5, 10);
        System.out.println("Área: " + ret.calcularArea());
        System.out.println("Perímetro: " + ret.calcularPerimetro());
    }
}

