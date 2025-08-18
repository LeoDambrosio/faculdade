package br.com.guilhermevillaca.padroes.comportamentais.observer;

/**
 *
 * @author villaca
 */
// Interface Sujeito que define métodos para gerenciar observadores
public interface Sujeito {

    void adicionarObservador(Observer observador);

    void removerObservador(Observer observador);

    void notificarObservadores();
}
