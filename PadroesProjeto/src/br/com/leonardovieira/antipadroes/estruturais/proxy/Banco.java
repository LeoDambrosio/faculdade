package br.com.guilhermevillaca.antipadroes.estruturais.proxy;

public class Banco {

    public void processarPagamento(String cliente, double valor) {
        System.out.println("Banco: Processando pagamento de R$" + valor + " para " + cliente);
    }

}
