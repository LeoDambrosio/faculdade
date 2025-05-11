package br.com.leonardovieira.exercicio1;

public class Desenvolvedor {
    public class Desenvolvedor extends Funcionario {
    private double desconto;

    public Desenvolvedor(String nome, double salarioBase, double desconto) {
        super(nome, salarioBase);
        this.desconto = desconto;
    }

    @Override
    public double calcularSalarioTotal() {
        return salarioBase - desconto;
    }
}

}
