package br.com.leonardovieira.padroes.comportamentais.observer;

/**
 *
 *
 * O padrão de projeto Observer define uma dependência um-para-muitos entre
 * objetos, de modo que quando um objeto muda de estado, todos os seus
 * dependentes são notificados e atualizados automaticamente. Esse padrão é
 * comumente usado em cenários onde o estado de um objeto deve ser comunicado a
 * múltiplos outros objetos, como em sistemas de eventos, interfaces de usuário,
 * etc.
 *
 * Exemplo: Sistema de Notificação de Alterações em Estoque Vamos implementar um
 * exemplo onde um sistema notifica observadores (clientes) sobre mudanças no
 * estoque de um produto.
 *
 *
 * Explicação: Produto é o Sujeito que mantém uma lista de Observer (clientes)
 * que precisam ser notificados quando a quantidade do produto muda. Cliente é
 * um Observer que reage à mudança no estado do Produto. Quando o estado do
 * Produto (a quantidade em estoque) muda, ele notifica todos os Observer
 * registrados, que então executam sua lógica de atualização. Este exemplo
 * demonstra o padrão Observer em um cenário prático de notificação de clientes
 * sobre alterações no estoque de produtos.
 *
 */
public class Principal {

    public static void main(String[] args) {
        // Criando o produto
        Produto produto = new Produto("Notebook", 10);

        // Criando observadores (clientes)
        Cliente cliente1 = new Cliente("Alice");
        Cliente cliente2 = new Cliente("Bob");

        // Registrando os clientes para receber notificações sobre o produto
        produto.adicionarObservador(cliente1);
        produto.adicionarObservador(cliente2);

        // Modificando o estado do produto, o que deve disparar notificações para os observadores
        produto.setQuantidade(5);
        produto.setQuantidade(0);

        // Removendo um cliente e mudando o estado do produto novamente
        produto.removerObservador(cliente2);
        produto.setQuantidade(20);
    }
}
