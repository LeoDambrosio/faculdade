public class Main1 {
    public static void main(String[] args) {
        Funcionario engenheiro = new Engenheiro(8000.0);
        Funcionario vendedor = new Vendedor(4000.0);

        System.out.println("Engenheiro:");
        engenheiro.trabalhar();
        engenheiro.descansar();
        System.out.println("Salário: R$" + engenheiro.getSalario());

        System.out.println("\nVendedor:");
        vendedor.trabalhar();
        vendedor.descansar();
        System.out.println("Salário: R$" + vendedor.getSalario());
    }
}
