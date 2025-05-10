package Polimosfismo.src.br.com.leonardovieira.exercicio1;

public class Desenvolvedor extends Funcionario {
    private double desconto;

    public double getDesconto() {
        return desconto;
    }

    public void setDesconto(double desconto) {
        this.desconto = desconto;
    }

    @Override
    public double calcularSalarioTotal() {
        return this.salarioBase - this.desconto;
    }
}
p
