package br.com.leonardovieira.padroes.comportamentais.strategy;


// Classe concreta que implementa pagamento via PayPal
public class PagamentoPayPal implements PagamentoStrategy {

    private String email;

    public PagamentoPayPal(String email) {
        this.email = email;
    }

    @Override
    public void pagar(double valor) {
        System.out.println("Pagamento de R$" + valor + " realizado via PayPal. Conta: " + email);
    }
}
