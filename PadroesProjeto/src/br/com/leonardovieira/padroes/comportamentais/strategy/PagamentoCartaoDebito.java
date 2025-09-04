package br.com.leonardovieira.padroes.comportamentais.strategy;

public class PagamentoCartaoDebito implements PagamentoStrategy {

    private String numeroConta;
    private String nomeTitular;

    public PagamentoCartaoDebito(String nomeTitular, String numeroConta) {
        this.nomeTitular = nomeTitular;
        this.numeroConta = numeroConta;
    }

    @Override
    public void pagar(double valor) {
        System.out.println("Pagamento de R$ " + valor + "realizardo com Debito." + "Titular: " + nomeTitular + ". Conta " + numeroConta);
    }
}
