package br.com.leonardovieira.poo.exercicio1;

public class Retangulo {
    private double largura;
    private double altura;

    public Retangulo(double largura, double altura) {
        this.altura = altura;
        this.largura = largura;
    }

    public double calcularArea() {
        return largura * altura;
    }

    public double calcularPerimetro() {
        return 2 * (largura + altura);
    }
}
