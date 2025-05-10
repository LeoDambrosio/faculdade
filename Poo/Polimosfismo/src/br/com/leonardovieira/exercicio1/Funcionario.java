package Polimosfismo.src.br.com.leonardovieira.exercicio1;

public class Funcionario {
    private String nome;
    protected double salarioBase;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getSalarioBase() {
        return salarioBase;
    }

    public void setSalarioBase(double salarioBase) {
        this.salarioBase = salarioBase;
    }

    public double calcularSalarioTotal() {
        return this.salarioBase;
    }
}
