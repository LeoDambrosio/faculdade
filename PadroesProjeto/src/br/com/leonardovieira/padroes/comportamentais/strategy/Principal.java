package br.com.leonardovieira.padroes.comportamentais.strategy;

/**
 *
 *
 * O padrão Strategy define uma família de algoritmos, encapsula cada um deles e
 * os torna intercambiáveis. O padrão permite que o algoritmo varie
 * independentemente dos clientes que o utilizam.
 *
 * Vamos implementar um exemplo em Java onde um sistema de pagamento pode ter
 * diferentes estratégias de pagamento, como pagamento por cartão de crédito,
 * PayPal e transferência bancária.
 *
 * Explicação: PagamentoCartaoCredito, PagamentoPayPal e
 * PagamentoTransferenciaBancaria são as diferentes estratégias de pagamento que
 * implementam a interface PagamentoStrategy. A classe CarrinhoDeCompras utiliza
 * uma dessas estratégias para processar o pagamento. A estratégia de pagamento
 * pode ser alterada dinamicamente em tempo de execução, permitindo
 * flexibilidade na escolha do método de pagamento. Este exemplo mostra como o
 * padrão Strategy pode ser usado para variar o comportamento de um objeto
 * (neste caso, a forma de pagamento) de maneira flexível e modular.
 */
public class Principal {

    public static void main(String[] args) {
        CarrinhoDeCompras carrinho = new CarrinhoDeCompras();

        // Define e usa a estratégia de pagamento com cartão de crédito
        carrinho.setEstrategiaDePagamento(new PagamentoCartaoCredito("1234-5678-9101-1121", "João Silva"));
        carrinho.pagar(250.0);

        // Muda a estratégia para pagamento via PayPal
        carrinho.setEstrategiaDePagamento(new PagamentoPayPal("joao.silva@exemplo.com"));
        carrinho.pagar(150.0);

        // Muda a estratégia para pagamento por transferência bancária
        carrinho.setEstrategiaDePagamento(new PagamentoTransferenciaBancaria("987654321"));
        carrinho.pagar(500.0);
    }
}
