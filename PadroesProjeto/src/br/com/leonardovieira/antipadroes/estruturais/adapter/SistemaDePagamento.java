package br.com.guilhermevillaca.antipadroes.estruturais.adapter;

// 🛑 Tentativa errada de integrar os dois sistemas manualmente
class SistemaDePagamento {
    private boolean usarSistemaNovo;
    private PagamentoAntigo sistemaAntigo = new PagamentoAntigo();
    private PagamentoNovo sistemaNovo = new PagamentoNovo();

    public SistemaDePagamento(boolean usarNovo) {
        this.usarSistemaNovo = usarNovo;
    }

    public void realizarPagamento(double valor) {
        if (usarSistemaNovo) {
            // Gambiarra para adaptar ao novo sistema
            System.out.println("Convertendo valor para novo sistema...");
            sistemaNovo.pagar(valor);
        } else {
            sistemaAntigo.processarPagamento(valor);
        }
    }
}