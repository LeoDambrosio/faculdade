package br.com.guilhermevillaca.padroes.exercicios.comportamental1;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author guilherme.villaca
 */
public class Noticia {

    private List<Observer> observadores = new ArrayList<>();
    private String conteudo;

    public void adicionarObservador(Observer observador) {
        observadores.add(observador);
    }

    public void removerObservador(Observer observador) {
        observadores.remove(observador);
    }

    public void notificarObservadores() {
        for (Observer observador : observadores) {
            observador.atualizar(conteudo);
        }
    }

    public void publicarNoticia(String conteudo) {
        this.conteudo = conteudo;
        notificarObservadores();
    }
}
