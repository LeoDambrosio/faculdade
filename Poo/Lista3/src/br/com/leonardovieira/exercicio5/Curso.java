package Lista3.src.br.com.leonardovieira.exercicio5;

public class Curso {
    private String nomeCurso;
    private String codigoCurso;

    public Curso(String nomeCurso, String codigoCurso) {
        this.nomeCurso = nomeCurso;
        this.codigoCurso = codigoCurso;
    }

    public void exibirCurso() {
        System.out.println("\nCurso: " + nomeCurso);
        System.out.println("Codigo: " + codigoCurso);
    }
}

