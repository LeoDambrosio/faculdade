package br.com.leonardovieira.poo.exercicio1;

public class Curso {
    private String nomeCurso;
    private String codigoCurso;

    public Curso(String nomeCurso, String codigoCurso) {
        this.nomeCurso = nomeCurso;
        this.codigoCurso = codigoCurso;
    }

    public void exibirCurso() {
        System.out.println("Curso: " + nomeCurso);
        System.out.println("Código: " + codigoCurso);
    }
}

