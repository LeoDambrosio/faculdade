package br.com.leonardovieira.padroes.comportamentais.strategy;


// Classe concreta que implementa pagamento por transferência bancária
public class PagamentoTransferenciaBancaria implements PagamentoStrategy {

    private String numeroConta;

    public PagamentoTransferenciaBancaria(String numeroConta) {
        this.numeroConta = numeroConta;
    }

    @Override
    public void pagar(double valor) {
        System.out.println("Pagamento de R$" + valor + " realizado por transferência bancária. Conta: " + numeroConta);
    }
}
