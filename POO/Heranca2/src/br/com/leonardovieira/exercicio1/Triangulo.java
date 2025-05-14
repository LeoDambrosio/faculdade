package br.com.leonardovieira.exercicio1;

public class Triangulo extends Forma {
    double base, altura;

    public Triangulo(double base, double altura) {
        this.base = base;
        this.altura = altura;
    }

    @Override
    public double calcularArea() {
        return (base * altura) / 2;
    }

    @Override
    public String toString() {
        return "Triângulo com base " + base + " e altura " + altura + " - Área: " + calcularArea();
    }
}