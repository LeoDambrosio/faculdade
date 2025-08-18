package br.com.guilhermevillaca.padroes.estruturais.adapter;

// 🎯 Novo sistema de pagamento (com um método diferente)
class PagamentoNovo {
    public void pagar(double montante) {
        System.out.println("Pagamento de R$" + montante + " processado pelo sistema novo.");
    }
}