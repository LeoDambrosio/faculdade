package br.com.guilhermevillaca.padroes.estruturais.adapter;

// ✅ Agora o sistema pode usar qualquer método de pagamento sem mudar sua lógica
class SistemaDePagamento {
    private Pagamento metodoPagamento;

    public SistemaDePagamento(Pagamento metodoPagamento) {
        this.metodoPagamento = metodoPagamento;
    }

    public void realizarPagamento(double valor) {
        metodoPagamento.pagar(valor);
    }
}