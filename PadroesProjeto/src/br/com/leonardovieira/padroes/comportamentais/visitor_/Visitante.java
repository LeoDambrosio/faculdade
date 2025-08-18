package br.com.guilhermevillaca.padroes.comportamentais.visitor_;

/**
 *
 * @author guilherme.villaca
 */
public interface Visitante {

    void visitar(Livro livro);

    void visitar(Fruta fruta);
}
