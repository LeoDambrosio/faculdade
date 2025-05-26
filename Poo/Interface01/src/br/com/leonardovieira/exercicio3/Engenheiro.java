public class Engenheiro extends Funcionario{
    public Engenheiro(double salario) {
        super(salario);
    }

    @Override
    public void trabalhar() {
        System.out.println("O engenheiro esta projetando um predio.");
    }

    @Override
    public void descansar() {
        System.out.println("O engenheiro está descansando apos o expediente.");
    }

}
