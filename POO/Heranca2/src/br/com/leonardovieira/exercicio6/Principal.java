package br.com.leonardovieira.exercicio6;

public class Principal {
    public static void main(String[] args) {
        Professor prof = new Professor("Carla", 40, "Engenharia");
        Aluno aluno = new Aluno("Lucas", 20, "Ciência da Computação");

        prof.apresentar();
        aluno.apresentar();
    }
}
