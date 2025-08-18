package br.com.leonardovieira.padroes.comportamentais.strategy;


// Classe CarrinhoDeCompras que utiliza uma estratégia de pagamento
public class CarrinhoDeCompras {

    private PagamentoStrategy estrategiaDePagamento;

    // Permite definir a estratégia de pagamento em tempo de execução
    public void setEstrategiaDePagamento(PagamentoStrategy estrategiaDePagamento) {
        this.estrategiaDePagamento = estrategiaDePagamento;
    }

    // Executa o pagamento usando a estratégia definida
    public void pagar(double valor) {
        estrategiaDePagamento.pagar(valor);
    }
}
