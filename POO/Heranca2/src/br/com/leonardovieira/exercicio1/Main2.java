package br.com.leonardovieira.exercicio1;

public class Main2 {
    public static void main(String[] args) {
        Forma circulo = new Circulo(5.0);
        Forma triangulo = new Triangulo(4.0, 3.0);
        Forma retangulo = new Retangulo(6.0, 2.0);

        System.out.println(circulo);
        System.out.println(triangulo);
        System.out.println(retangulo);
    }
}