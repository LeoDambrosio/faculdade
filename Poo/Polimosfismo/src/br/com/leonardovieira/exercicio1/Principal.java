package Polimosfismo.src.br.com.leonardovieira.exercicio1;

public class Principal {
    public static void main(String[] args) {
        Gerente g = new Gerente();

        g.setNome("Erico");
        g.setSalarioBase(50000.0); // Corrigido: era string
        g.setBonus(100000.0);      // Corrigido: era string

        System.out.println("Salário total do gerente " + g.getNome() + ": R$" + g.calcularSalarioTotal());
    }
}
