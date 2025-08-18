package br.com.leonardovieira.padroes.comportamentais.strategy;


// Interface PagamentoStrategy que define o método para realizar pagamento
public interface PagamentoStrategy {

    void pagar(double valor);
}
