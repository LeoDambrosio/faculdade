package br.com.leonardovieira.Interface.Exemplo1;

public class Principal {
    public static void main(String[] args) {
        ContaBancaria conta = new ContaBancaria();

        conta.depositar(500);
        conta.sacar(200);
        conta.consultarSaldo();
        conta.gerarRelatorio();
    }
}
