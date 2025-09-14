package br.com.leonardovieira.padroes.comportamentais.strategy;

public class PagamentoPix implements PagamentoStrategy {

    private String chavePix;
    private String nomeTitular;

    public PagamentoPix(String chavePix, String nomeTitular) {
        this.chavePix = chavePix;
        this.nomeTitular = nomeTitular;
    }

    @Override
    public void pagar(double valor) {
        System.out.println("Pagamento de R$" + valor + " realizado por " + nomeTitular);
    }
}
