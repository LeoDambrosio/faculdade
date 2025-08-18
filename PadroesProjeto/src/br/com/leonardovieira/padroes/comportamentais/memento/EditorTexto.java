package br.com.leonardovieira.padroes.comportamentais.memento;


// Originator - Classe que deseja salvar e restaurar seu estado
public class EditorTexto {

    private StringBuilder texto;

    public EditorTexto() {
        texto = new StringBuilder();
    }

    // Adiciona texto ao editor
    public void escrever(String novoTexto) {
        texto.append(novoTexto);
    }

    // Mostra o conteúdo atual do editor
    public String mostrarTexto() {
        return texto.toString();
    }

    // Cria um Memento para salvar o estado atual
    public TextoMemento salvar() {
        return new TextoMemento(texto.toString());
    }

    // Restaura o estado a partir de um Memento
    public void desfazer(TextoMemento memento) {
        texto = new StringBuilder(memento.getEstado());
    }
}
