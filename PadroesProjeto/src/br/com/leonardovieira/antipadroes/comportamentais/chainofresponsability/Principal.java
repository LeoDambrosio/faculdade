package br.com.leonardovieira.antipadroes.comportamentais.chainofresponsability;

public class Principal {
    public static void main(String[] args) {
        PagamentoProcessor processor = new PagamentoProcessor();
        processor.processarPagamento("João", 300);
        processor.processarPagamento("Maria", 700);
    }
}