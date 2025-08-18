package br.com.leonardovieira.padroes.comportamentais.memento;


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
