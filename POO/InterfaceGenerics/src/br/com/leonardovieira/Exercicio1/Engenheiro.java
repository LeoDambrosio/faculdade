public class Engenheiro extends Funcionario{
    public Engenheiro (double salari){
        super(salario);
    }

     @Override
    public void trabalhar() {
        System.out.println("Engenheiro está projetando sistemas.");
    }

    @Override
    public void descansar() {
        System.out.println("Engenheiro está descansando no fim de semana.");
    }

}
