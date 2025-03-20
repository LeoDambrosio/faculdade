package br.com.leonardovieira.exerciciop2;

public class PrincipalAluno {

    public static void main(String[] args) {
        Aluno a1 = new Aluno();

        a1.nome = "Leonardo";
        a1.idade = 20;
        a1.matricula = 523;

        System.out.println("Nome: " + a1.nome);
        System.out.println("Idade: " + a1.idade);
        System.out.println("Matricula:" + a1.matricula);
    }

}
