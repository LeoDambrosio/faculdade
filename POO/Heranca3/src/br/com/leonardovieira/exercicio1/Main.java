package br.com.leonardovieira.exercicio1;

public class Main {
    public static void main(String[] args) {
        Funcionario f1 = new Gerente("Ana", 8000.0, 2000.0);
        Funcionario f2 = new Desenvolvedor("Carlos", 5000.0, 500.0);
        Funcionario f3 = new Analista("Fernanda", 4000.0);

        f1.exibirDados();
        System.out.println();
        f2.exibirDados();
        System.out.println();
        f3.exibirDados();
    }
}