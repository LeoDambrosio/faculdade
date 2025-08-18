package br.com.guilhermevillaca.padroes.comportamentais.strategy;

/**
 *
 * @author villaca
 */
// Interface PagamentoStrategy que define o método para realizar pagamento
public interface PagamentoStrategy {

    void pagar(double valor);
}
