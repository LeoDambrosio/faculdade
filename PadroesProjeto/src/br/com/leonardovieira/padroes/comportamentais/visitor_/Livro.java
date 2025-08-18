package br.com.guilhermevillaca.padroes.comportamentais.visitor_;

/**
 *
 * @author guilherme.villaca
 */
public class Livro implements Item {

    private String titulo;
    private double preco;

    public Livro(String titulo, double preco) {
        this.titulo = titulo;
        this.preco = preco;
    }

    public String getTitulo() {
        return titulo;
    }

    public double getPreco() {
        return preco;
    }

    @Override
    public void aceitar(Visitante visitante) {
        visitante.visitar(this);
    }
}
