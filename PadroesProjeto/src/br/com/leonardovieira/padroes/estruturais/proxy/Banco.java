package br.com.guilhermevillaca.padroes.estruturais.proxy;

public class Banco implements ServicoBanco {

    public void processarPagamento(String cliente, double valor) {
        System.out.println("Banco: Pagamento de R$" + valor + " processado para " + cliente);
    }

}
