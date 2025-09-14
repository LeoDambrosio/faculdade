package br.com.leonardovieira.padroes.comportamentais.iterator;


public interface Iterador<T> {

    boolean temProximo();

    T proximo();
}
