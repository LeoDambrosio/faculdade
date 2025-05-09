package Polimosfismo.src.br.com.leonardovieira.exercicio1;

public class Gerente extends Funcionario {
    private double bonus;

    public double getBonus() {
        return bonus;
    }

    public void setBonus(double bonus) {
        this.bonus = bonus;
    }

    @Override
    public double calcularSalarioTotal() {
        return this.salarioBase + this.bonus;
    }
}