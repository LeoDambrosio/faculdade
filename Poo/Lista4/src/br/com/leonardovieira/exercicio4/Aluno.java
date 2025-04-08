package Lista4.src.br.com.leonardovieira.exercicio4;

public class Aluno {
    private String nome;
    private double nota;

    public Aluno(String nome, double nota) {
        this.nome = nome;
        this.nota = nota;
    }

    public void exibirInfo() {
        System.out.println("Nome do aluno: " + this.nome);
        System.out.println("Nota: " + this.nota);
        System.out.println("------------------------");
    }
}

