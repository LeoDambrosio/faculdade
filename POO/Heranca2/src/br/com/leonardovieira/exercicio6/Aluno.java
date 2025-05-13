package br.com.leonardovieira.exercicio6;

public class Aluno extends Pessoa {
    private String curso;

    public Aluno(String nome, int idade, String curso) {
        super(nome, idade);
        this.curso = curso;
    }

    @Override
    public void apresentar() {
        System.out.println("Aluno: " + nome + ", Idade: " + idade + ", Curso: " + curso);
    }
}

