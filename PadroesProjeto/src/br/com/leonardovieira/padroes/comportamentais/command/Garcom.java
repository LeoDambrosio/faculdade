package br.com.leonardovieira.padroes.comportamentais.command;

public class Garcom {

    public void enviarPedido(Pedido pedido) {
        pedido.executar();
    }

}
