package br.com.guilhermevillaca.padroes.comportamentais.memento;

/**
 *
 * @author villaca
 */
// Memento armazena o estado do objeto
public class TextoMemento {

    private final String estado;

    public TextoMemento(String estado) {
        this.estado = estado;
    }

    public String getEstado() {
        return estado;
    }
}
