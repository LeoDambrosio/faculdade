package br.com.leonardovieira.padroes.comportamentais.strategy;

public class CarrinhoDeCompras {

    private PagamentoStrategy estrategiaDePagamento;

    public void setEstrategiaDePagamento(PagamentoStrategy estrategiaDePagamento) {
        this.estrategiaDePagamento = estrategiaDePagamento;
    }

    @Override
    public void pagar(double valor) {
        estrategiaDePagamento.pagar(valor);
    }
}
