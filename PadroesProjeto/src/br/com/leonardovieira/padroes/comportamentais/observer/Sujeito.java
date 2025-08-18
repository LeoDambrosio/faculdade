package br.com.leonardovieira.padroes.comportamentais.observer;


// Interface Sujeito que define métodos para gerenciar observadores
public interface Sujeito {

    void adicionarObservador(Observer observador);

    void removerObservador(Observer observador);

    void notificarObservadores();
}
