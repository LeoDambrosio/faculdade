public class Engenheiro extends Funcionario {
    
    public Engenheiro(double salario) {
        super(salario);
    }

    @Override
    public void trabalhar() {
        System.out.println("Engenheiro projetando estruturas e resolvendo problemas complexos");
    }

    @Override
    public void descansar() {
        System.out.println("Engenheiro descansando após cálculos exaustivos");
    }

    public void analisarProjeto() {
        System.out.println("Analisando viabilidade do projeto");
    }
}
