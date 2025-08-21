package br.com.leonardovieira.padroes.comportamentais.memento;

public class Principal {

    public static void main(String[] args) {
        EditorTexto editor = new EditorTexto();
        Historico historico = new Historico();

        editor.escrever("Olá, ");
        historico.salvarMemento(editor.salvar());

        editor.escrever("mundo!");
        historico.salvarMemento(editor.salvar());

        editor.escrever(" Este é um editor de texto.");

        System.out.println("Texto atual: " + editor.mostrarTexto());

        editor.desfazer(historico.desfazer());
        System.out.println("Após desfazer: " + editor.mostrarTexto());

        editor.desfazer(historico.desfazer());
        System.out.println("Após desfazer novamente: " + editor.mostrarTexto());
    }
}
