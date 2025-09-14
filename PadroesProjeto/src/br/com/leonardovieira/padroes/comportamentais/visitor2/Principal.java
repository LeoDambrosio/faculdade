package br.com.leonardovieira.padroes.comportamentais.visitor2;
public class Principal {

    public static void main(String[] args) {
        Item[] itens = new Item[]{
            new Livro("Padroes de Projeto", 50.0),
            new Livro("Programacao Java", 30.0),
            new Fruta("Maca", 2.5, 10.0),
            new Fruta("Banana", 1.5, 5.0)
        };

        Visitante visitante = new VisitanteCarrinhoCompras();
        for (Item item : itens) {
            item.aceitar(visitante);
        }
    }
}
