package br.com.leonardovieira.exercicio1;

public class Retangulo extends Forma {
    double lado1, lado2;

    public Retangulo(double lado1, double lado2) {
        this.lado1 = lado1;
        this.lado2 = lado2;
    }

    @Override
    public double calcularArea() {
        return lado1 * lado2;
    }

    @Override
    public String toString() {
        return "Retângulo com lados " + lado1 + " e " + lado2 + " - Área: " + calcularArea();
    }
}