package Lista4.src.br.com.leonardovieira.exercicio6;

public class Funcionario {
    private String nome; 
    private static int totalFuncionarios = 0; 

    public Funcionario(String nome) {
        this.nome = nome;
        totalFuncionarios++; 
    }

    public String getNome() {
        return nome;
    }

    public static int getTotalFuncionarios() {
        return totalFuncionarios;
    }
}

