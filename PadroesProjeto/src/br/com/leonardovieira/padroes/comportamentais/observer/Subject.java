package br.com.leonardovieira.padroes.comportamentais.observer;

public interface Subject {

    void adicionarObservador(Observer observador);

    void removerObservador(Observer observador);

    void notificarObservadores();
}
