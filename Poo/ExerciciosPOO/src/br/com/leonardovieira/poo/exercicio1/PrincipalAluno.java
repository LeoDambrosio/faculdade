package br.com.leonardovieira.poo.exercicio1;

import java.util.Scanner;

public class PrincipalAluno {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Digite o nome do aluno: ");
        String nomeAluno = scanner.nextLine();

        System.out.print("Digite a idade do aluno: ");
        int idadeAluno = scanner.nextInt();
        scanner.nextLine(); 

        System.out.print("Digite o número de matrícula: ");
        String matriculaAluno = scanner.nextLine();

        System.out.print("Digite o nome do curso: ");
        String nomeCurso = scanner.nextLine();

        System.out.print("Digite o código do curso: ");
        String codigoCurso = scanner.nextLine();

        scanner.close();

        Aluno aluno = new Aluno(nomeAluno, idadeAluno, matriculaAluno);
        Curso curso = new Curso(nomeCurso, codigoCurso);

        aluno.exibirInformacoes();
        curso.exibirCurso();
    }
}

