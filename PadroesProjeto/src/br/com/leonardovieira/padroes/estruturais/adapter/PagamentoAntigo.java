package br.com.guilhermevillaca.padroes.estruturais.adapter;

// 🎯 Interface do sistema antigo de pagamento (que já funciona)
class PagamentoAntigo {
    public void processarPagamento(double valor) {
        System.out.println("Pagamento de R$" + valor + " processado pelo sistema antigo.");
    }
}