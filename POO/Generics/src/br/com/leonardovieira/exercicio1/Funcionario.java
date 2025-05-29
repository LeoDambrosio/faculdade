public abstract class Funcionario {
    protected double salario;

    public Funcionario(double salario) {
        this.salario = salario;
    }

    public double getSalario() {
        return salario;
    }

    public abstract void trabalhar();

    public abstract void descansar();
}


