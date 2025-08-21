package br.com.leonardovieira.padroes.comportamentais.memento;

public class EditorTexto {

    private StringBuilder texto;

    public EditorTexto() {
        texto = new StringBuilder();
    }

    public void escrever(String novoTexto) {
        texto.append(novoTexto);
    }

    public String mostrarTexto() {
        return texto.toString();
    }

    public TextoMemento salvar() {
        return new TextoMemento(texto.toString());
    }

    public void desfazer(TextoMemento memento) {
        texto = new StringBuilder(memento.getEstado());
    }
}
