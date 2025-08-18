package br.com.guilhermevillaca.padroes.comportamentais.memento;

import java.util.Stack;

/**
 *
 * @author villaca
 */
public class Historico {

    private Stack<TextoMemento> historico = new Stack<>();

    public void salvarMemento(TextoMemento memento) {
        historico.push(memento);
    }

    public TextoMemento desfazer() {
        if (!historico.isEmpty()) {
            return historico.pop();
        }
        return null;
    }
}
