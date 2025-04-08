package Lista4.src.br.com.leonardovieira.exercicio6;

public class PrincipalFuncionario {
    public static void main(String[] args) {

        Funcionario f1 = new Funcionario("Leonardo");
        Funcionario f2 = new Funcionario("Carla");
        Funcionario f3 = new Funcionario("André");

        System.out.println("Funcionario 1: " + f1.getNome());
        System.out.println("Funcionario 2: " + f2.getNome());
        System.out.println("Funcionario 3: " + f3.getNome());

        System.out.println("\nTotal de funcionarios: " + Funcionario.getTotalFuncionarios());
    }
}
