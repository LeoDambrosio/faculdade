package br.com.leonardovieira.realacionamento;

public class Principal {

    public static void main(String[] args) {
        
        Departamento d1 = new Departamento("TI");
        Funcionario func1 = new Funcionario("Paulo");
        Funcionario func2 = new Funcionario("Debora");

        d1.adicionarFuncionario(func1);
        d1.adicionarFuncionario(func2);

        System.out.println("Departamento: " + d1.getNome());

        for (Funcionario f : d1.getFuncionarios()) {

            System.out.println("Funcionario: " + f.getNome());
            
        }

        System.out.println("-------------------");

        for(int i = 0; i < d1.getFuncionarios().size(); i++){
            String nome = d1.getFuncionarios().get(i).getNome();
            System.out.println("Funcionario: " + nome);
        }

    }

}