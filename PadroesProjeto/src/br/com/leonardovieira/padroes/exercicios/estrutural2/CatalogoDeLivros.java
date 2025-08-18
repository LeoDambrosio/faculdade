package br.com.guilhermevillaca.padroes.exercicios.estrutural2;

/**
 *
 * @author guilherme.villaca
 */
public class CatalogoDeLivros {
    public void adicionarLivro(String titulo) {
        System.out.println("Livro '" + titulo + "' adicionado ao catálogo.");
    }

    public boolean buscarLivro(String titulo) {        
        System.out.println("Livro '" + titulo + "' encontrado no catálogo.");
        return true;
    }
}