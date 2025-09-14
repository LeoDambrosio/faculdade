package br.com.leonardovieira.antipadroes.estruturais.adapter;

class PagamentoNovo {
    public void pagar(double montante) {
        System.out.println("Pagamento de R$" + montante + " processado pelo sistema novo.");
    }
}