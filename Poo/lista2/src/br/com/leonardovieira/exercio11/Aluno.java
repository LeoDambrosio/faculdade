package lista2.src.br.com.leonardovieira.exercio11;

public class Aluno {
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
