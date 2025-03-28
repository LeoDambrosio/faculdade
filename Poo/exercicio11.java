import java.util.Scanner;

class Aluno {
    private String nome;
    private double nota;
    
    public Aluno(String nome, double nota) {
        this.nome = nome;
        this.nota = nota;
    }
    
    public String verificarAprovacao() {
        return nota >= 7 ? "Aprovado" : "Reprovado";
    }
    
    public String getNome() {
        return nome;
    }
    
    public double getNota() {
        return nota;
    }
}

public class exercicio11 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Aluno[] alunos = new Aluno[10];
        
        System.out.println("CADASTRO DE ALUNOS");
        System.out.println("------------------");
        
        for (int i = 0; i < 10; i++) {
            System.out.println("\nAluno " + (i+1) + ":");
            
            System.out.print("Nome: ");
            String nome = scanner.nextLine();
            
            System.out.print("Nota (0-10): ");
            while (!scanner.hasNextDouble()) {
                System.out.println("Valor inválido! Digite um número.");
                scanner.next();
            }
            double nota = scanner.nextDouble();
            scanner.nextLine(); 

            while (nota < 0 || nota > 10) {
                System.out.println("Nota deve ser entre 0 e 10. Digite novamente:");
                nota = scanner.nextDouble();
                scanner.nextLine();
            }
            
            alunos[i] = new Aluno(nome, nota);
        }
        
        System.out.println("\nRESULTADOS:");
        System.out.println("----------------------------------");
        System.out.printf("%-20s %-6s %-10s\n", "NOME", "NOTA", "SITUAÇÃO");
        
        for (Aluno aluno : alunos) {
            System.out.printf("%-20s %-6.1f %-10s\n",
                           aluno.getNome(),
                           aluno.getNota(),
                           aluno.verificarAprovacao());
        }
        
        scanner.close();
    }
}