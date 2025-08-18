package br.com.leonardovieira.padroes.comportamentais.strategy;


// Classe concreta que implementa pagamento por cartão de crédito
public class PagamentoCartaoCredito implements PagamentoStrategy {

    private String numeroCartao;
    private String nomeTitular;

    public PagamentoCartaoCredito(String numeroCartao, String nomeTitular) {
        this.numeroCartao = numeroCartao;
        this.nomeTitular = nomeTitular;
    }

    @Override
    public void pagar(double valor) {
        System.out.println("Pagamento de R$" + valor + " realizado com cartão de crédito. Titular: " + nomeTitular);
    }
}
