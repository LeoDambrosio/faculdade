package br.com.leonardovieira.padroes.comportamentais.command;

public class PedidoPizza implements Pedido {
    private Cozinheiro cozinheiro;

    public PedidoPizza(Cozinheiro cozinheiro) {
        this.cozinheiro = cozinheiro;
    }

    @Override
    public void executar() {
        cozinheiro.fazerPizza();
    }
}