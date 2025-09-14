package br.com.leonardovieira.padroes.comportamentais.visitor_;

/**
 *
 *
 * Explicação: Item (Interface Elemento): A interface Item define o método
 * aceitar, que recebe um objeto Visitante. Cada classe concreta que implementa
 * essa interface precisa implementar esse método.
 *
 * Livro e Fruta (Elementos Concretos): Essas classes implementam a interface
 * Item. Cada uma delas implementa o método aceitar, que chama o método visitar
 * apropriado do Visitante.
 *
 * Visitante (Interface Visitante): A interface Visitante define métodos visitar
 * específicos para cada tipo de Item. No exemplo, temos métodos visitar para
 * Livro e Fruta.
 *
 * VisitanteCarrinhoCompras (Visitante Concreto): Esta é uma implementação
 * concreta do Visitante. Ela define o que acontece quando cada tipo de item é
 * "visitado". No exemplo, o custo de cada item é calculado e exibido.
 *
 * Cliente: O código no método main cria uma lista de Itens e um
 * VisitanteCarrinhoCompras. Para cada item, o método aceitar é chamado,
 * permitindo que o Visitante processe cada item de forma específica.
 *
 * Este exemplo demonstra como o padrão Visitor pode ser usado para adicionar
 * funcionalidade (neste caso, calcular e exibir o custo dos itens) a classes
 * que pertencem a uma hierarquia, sem modificar essas classes diretamente.
 */
public class Principal {

    public static void main(String[] args) {
        Item[] itens = new Item[]{
            new Livro("Padrões de Projeto", 50.0),
            new Livro("Programação Java", 30.0),
            new Fruta("Maçã", 2.5, 10.0),
            new Fruta("Banana", 1.5, 5.0)
        };

        Visitante visitante = new VisitanteCarrinhoCompras();
        for (Item item : itens) {
            item.aceitar(visitante);
        }
    }
}
