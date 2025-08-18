package br.com.guilhermevillaca.padroes.comportamentais.command;

public class Garcom {

    public void enviarPedido(Pedido pedido) {
        pedido.executar();
    }

}
