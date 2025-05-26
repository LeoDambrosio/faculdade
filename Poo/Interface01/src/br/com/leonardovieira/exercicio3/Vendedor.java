public class Vendedor extends Funcionario {

    public Vendedor(double salario) {
        super(salario);
    }

    @Override
    public void trabalhar() {
        System.out.println("O vendedor está realizando vendas e atendendo clientes.");
    }

    @Override
    public void descansar() {
        System.out.println("O vendedor está descansando no fim do dia.");
    }
}