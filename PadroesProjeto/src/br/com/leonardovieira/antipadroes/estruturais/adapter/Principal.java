package br.com.leonardovieira.antipadroes.estruturais.adapter;

public class Principal {
    
    public static void main(String[] args) {
        SistemaDePagamento sistema = new SistemaDePagamento(false);
        sistema.realizarPagamento(100.00); // Usa sistema antigo

        SistemaDePagamento sistemaNovo = new SistemaDePagamento(true);
        sistemaNovo.realizarPagamento(200.00); // Usa sistema novo
    }
}
