public class Vendedor extends Funcionario{
    public Vendedor(double salario) {
        super(salario);
    }

     @Override
    public void trabalhar() {
        System.out.println("Vendedor está vendendo produtos.");
    }

    @Override
    public void descansar() {
        System.out.println("Vendedor está tirando um dia de folga.");
    }

}
