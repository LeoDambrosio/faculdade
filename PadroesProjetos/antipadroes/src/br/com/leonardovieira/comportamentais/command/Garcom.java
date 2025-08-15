package antipadroes.src.br.com.leonardovieira.comportamentais.command;

public class Garcom {

    public void enviarPedido(Pedido pedido){
        pedido.executar();
    }
}
