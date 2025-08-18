package br.com.leonardovieira.padroes.comportamentais.command;


/*
 * 
 * ✅ Benefícios do Command
✅ Baixo acoplamento: Garcom não depende diretamente de Cozinheiro, ele só conhece a interface Pedido.
✅ Fácil expansão: Para adicionar um novo prato, basta criar um novo comando. Nenhuma classe existente precisa ser alterada.
✅ Melhor organização: Separação clara de responsabilidades entre quem faz o pedido, quem executa e quem recebe.
✅ Flexibilidade: Podemos armazenar comandos em uma lista para desfazer/refazer ações no futuro.

Agora o código está organizado, escalável e pronto para novos pedidos! 🚀
 */
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
