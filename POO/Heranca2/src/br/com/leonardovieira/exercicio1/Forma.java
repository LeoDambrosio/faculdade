package br.com.leonadovieira.exercicio1;

public abstract class Forma {
    public abstract double calcularArea();

    @Override
    public String toString() {
        return "Forma Genérica";
    }
}


class Retangulo extends Forma {
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

class Triangulo extends Forma {
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

class Circulo extends Forma {
    double raio;

    public Circulo(double raio) {
        this.raio = raio;
    }

    @Override
    public double calcularArea() {
        return 3.14 * raio * raio; // corrigido: é área, não circunferência
    }

    @Override
    public String toString() {
        return "Círculo com raio " + raio + " - Área: " + calcularArea();
    }
}
