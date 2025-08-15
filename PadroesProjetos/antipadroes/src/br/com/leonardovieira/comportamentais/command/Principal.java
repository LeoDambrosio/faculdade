package antipadroes.src.br.com.leonardovieira.comportamentais.command;

public class Principal {

    public static void main(String[] args) {
        
        Cozinheiro cozinheiro = new Cozinheiro();
        Pedido pizza = new PedidoPizza(cozinheiro);
        Pedido hamburguer = new PedidoHamburguer(cozinheiro);

        Garcom garcom = new Garcom();

        garcom.enviarPedido(pizza);
        garcom.enviarPedido(hamburguer);
    }
}
