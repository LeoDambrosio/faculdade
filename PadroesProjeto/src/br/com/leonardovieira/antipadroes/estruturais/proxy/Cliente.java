package br.com.leonardovieira.antipadroes.estruturais.proxy;

public class Cliente {

    public static void main(String[] args) {
        Banco banco = new Banco();
        banco.processarPagamento("João", 500.00);
        banco.processarPagamento("Maria", 1200.00);
    }

}
