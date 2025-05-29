public class Empresa {
    public static void main(String[] args) {
        Funcionario engenheiro = new Engenheiro(8000.00);
        Funcionario vendedor = new Vendedor(4000.00);

        exibirInformacoes(engenheiro, "Engenheiro");
        System.out.println();
        exibirInformacoes(vendedor, "Vendedor");
    }

    public static void exibirInformacoes(Funcionario funcionario, String cargo) {
        System.out.println("Salário do " + cargo.toLowerCase() + ": R$" + funcionario.getSalario());
        funcionario.trabalhar();
        funcionario.descansar();
    }
}


