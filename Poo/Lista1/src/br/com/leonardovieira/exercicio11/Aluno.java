package Lista01.src.br.com.leonardovieira.exercicio11;

import java.util.Scanner;

public class Aluno {

    static class RegistroAluno {
        String nome;
        double nota;

        RegistroAluno(String nome, double nota) {
            this.nome = nome;
            this.nota = nota;
        }

        boolean aprovado() {
            return this.nota >= 7.0;
        }
    }

    public static void exercicio11() {
        Scanner scanner = new Scanner(System.in);
        RegistroAluno[] alunos = new RegistroAluno[10];

        for (int i = 0; i < alunos.length; i++) {
            System.out.print("Digite o nome do aluno: ");
            String nome = scanner.nextLine();

            System.out.print("Digite a nota do aluno: ");
            double nota = scanner.nextDouble();
            scanner.nextLine(); 

            alunos[i] = new RegistroAluno(nome, nota);
        }

        System.out.println("\nResultado dos alunos:");
        for (RegistroAluno aluno : alunos) {
            String status = aluno.aprovado() ? "Aprovado" : "Reprovado";
            System.out.println(aluno.nome + " - " + status);
        }
    }

    public static void main(String[] args) {
        exercicio11();
    }
}
