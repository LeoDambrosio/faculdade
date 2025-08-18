package br.com.guilhermevillaca.antipadroes.comportamentais.command;

public class Garcom {

    private Cozinheiro cozinheiro = new Cozinheiro();

    public void fazerPedido(String pedido) {
        if (pedido.equals("pizza")) {
            cozinheiro.fazerPizza();
        } else if (pedido.equals("hamburguer")) {
            cozinheiro.fazerHamburguer();
        } else {
            System.out.println("Garçom: Pedido desconhecido.");
        }
    }

}
