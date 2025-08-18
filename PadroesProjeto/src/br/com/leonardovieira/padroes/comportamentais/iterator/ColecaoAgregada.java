package br.com.guilhermevillaca.padroes.comportamentais.iterator;

/**
 *
 * @author villaca
 */
public interface ColecaoAgregada<T> {

    Iterador<T> criarIterador();
}
