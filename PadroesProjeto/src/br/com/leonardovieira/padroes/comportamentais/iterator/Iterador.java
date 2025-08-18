package br.com.guilhermevillaca.padroes.comportamentais.iterator;

/**
 *
 * @author villaca
 */
public interface Iterador<T> {

    boolean temProximo();

    T proximo();
}
