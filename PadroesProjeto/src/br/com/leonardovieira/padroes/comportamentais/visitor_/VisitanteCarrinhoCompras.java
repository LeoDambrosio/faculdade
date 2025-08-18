package br.com.leonardovieira.padroes.comportamentais.visitor_;

/**
 *
 */
public class VisitanteCarrinhoCompras implements Visitante {

    @Override
    public void visitar(Livro livro) {
        System.out.println("Livro: " + livro.getTitulo() + " custa " + livro.getPreco());
    }

    @Override
    public void visitar(Fruta fruta) {
        double custo = fruta.getPeso() * fruta.getPrecoPorKg();
        System.out.println("Fruta: " + fruta.getNome() + " custa " + custo);
    }
}
