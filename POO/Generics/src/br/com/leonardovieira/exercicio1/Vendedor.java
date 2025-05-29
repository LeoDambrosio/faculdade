public class Vendedor extends Funcionario {
    public Vendedor(double salario) {
        super(salario);
    }

    @Override
    public void trabalhar() {
        System.out.println("Vendedor atendendo clientes e fechando vendas");
    }

    @Override
    public void descansar() {
        System.out.println("Vendedor descansando após um dia intenso de vendas");
    }

    public void fazerDemonstracao() {
        System.out.println("Demonstrando produto para cliente");
    }
}