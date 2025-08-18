package br.com.guilhermevillaca.padroes.estruturais.adapter;

// 🏛️ Implementação do sistema novo, já compatível com a interface
class PagamentoNovoAdapter implements Pagamento {
    private PagamentoNovo sistemaNovo = new PagamentoNovo();

    @Override
    public void pagar(double valor) {
        sistemaNovo.pagar(valor);
    }
}
