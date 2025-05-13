package br.com.leonardovieira.exercicio6;

public class Professor extends Pessoa {
    private String departamento;

    public Professor(String nome, int idade, String departamento) {
        super(nome, idade);
        this.departamento = departamento;
    }

    @Override
    public void apresentar() {
        System.out.println("Professor: " + nome + ", Idade: " + idade + ", Departamento: " + departamento);
    }
}

