public class Empresa {
    public static void main(String[] args) {
        Funcionario engenheiro = new Engenheiro(8000.00);
        Funcionario vendedor = new Vendedor(4000.00);

        System.out.println("Salário do engenheiro: R$" + engenheiro.getSalario());
        engenheiro.trabalhar();
        engenheiro.descansar();

        System.out.println();

        System.out.println("Salário do vendedor: R$" + vendedor.getSalario());
        vendedor.trabalhar();
        vendedor.descansar();
    }
}