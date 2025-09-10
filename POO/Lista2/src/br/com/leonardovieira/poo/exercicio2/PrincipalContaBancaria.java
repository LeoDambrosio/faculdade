package br.com.leonardovieira.poo.exercicio2;

public class PrincipalContaBancaria {

    public static void main(String[] args) {
        ContaBancaria conta = new ContaBancaria();

        conta.setNumeroDaConta("12345-6");
        conta.setTitular("Maria Oliveira");
        conta.setSaldo(2500.75);

        System.out.println("Numero da Conta: " + conta.getNumeroDaConta());
        System.out.println("Titular: " + conta.getTitular());
        System.out.println("Saldo: R$ " + conta.getSaldo());
    }
}