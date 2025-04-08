package Lista3.src.br.com.leonardovieira.exercicio5;

public class PrincipalCadastroAluno {
    public static void main(String[] args) {

        String nome = "Leonardo Vieira Dambrosio";
        int idade = 21;
        String matricula = "12345";
        String nomeCurso = "TI";
        String codigoCurso = "TI2025";
        
        Aluno aluno = new Aluno(nome, idade, matricula);
        Curso curso = new Curso(nomeCurso, codigoCurso);

        aluno.exibirInformacoes();
        curso.exibirCurso();
    }
}

