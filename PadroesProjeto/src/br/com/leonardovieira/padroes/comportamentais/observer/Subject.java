package br.com.leonardovieira.padroes.comportamentais.observer;

public class Subject {

    void adicionarObservador(Observer observador);

    void removerObservador(Observer observador);

    void notificarObservador();
}
