package br.com.leonardovieira.padroesprojeto.comportamentais.strategy;

public class Principal {

    public static void main(String[] args) {
        CarrinhoDeCompras carrinho = new CarrinhoDeCompras();

        PagamentoStrategy debito = new PagamentoCartaoDebito("Leonardo Vieira Dambrosio", "1234-5678-9012-3456");
        carrinho.setEstrategiaDePagamento(debito);
        carrinho.pagar(750.0);

        PagamentoStrategy credito = new PagamentoCartaoCredito("1234-5678-9101-1121", "Leonardo Vieira Dambrosio");
        carrinho.setEstrategiaDePagamento(credito);
        carrinho.pagar(467.0);

        PagamentoStrategy pix = new PagamentoPix("45999103671", "Leonardo Vieira Dambrosio");
        carrinho.setEstrategiaDePagamento(pix);
        carrinho.pagar(80.0);
    }
}
