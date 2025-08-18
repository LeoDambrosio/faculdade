package br.com.leonardovieira.padroes.comportamentais.iterator;

public interface ColecaoAgregada<T> {

    Iterador<T> criarIterador();
}
