package br.com.guilhermevillaca.padroes.estruturais.adapter;

// 🏛️ Implementação do sistema antigo adaptada para a nova interface
class PagamentoAntigoAdapter implements Pagamento {
    private PagamentoAntigo sistemaAntigo = new PagamentoAntigo();

    @Override
    public void pagar(double valor) {
        sistemaAntigo.processarPagamento(valor);
    }
}