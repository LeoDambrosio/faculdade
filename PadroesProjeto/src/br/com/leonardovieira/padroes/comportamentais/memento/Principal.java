package br.com.leonardovieira.padroes.comportamentais.memento;

/**
 *
 * O padrão de projeto Memento é usado para capturar e restaurar o estado
 * interno de um objeto sem violar o princípio de encapsulamento. Ele é
 * especialmente útil quando você precisa implementar funcionalidades como
 * "desfazer" ou "restaurar" o estado de um objeto.
 *
 * Explicação: EditorTexto é a classe que desejamos controlar o estado. Ela cria
 * e restaura mementos para salvar e reverter seu estado. TextoMemento armazena
 * o estado atual do EditorTexto. Historico é o Caretaker que gerencia a pilha
 * de mementos, permitindo desfazer as alterações. No exemplo acima, o texto é
 * alterado várias vezes e, ao chamar desfazer, o estado do editor é restaurado
 * ao estado anterior, conforme armazenado no Memento.
 *
 *
 */
public class Principal {

    public static void main(String[] args) {
        EditorTexto editor = new EditorTexto();
        Historico historico = new Historico();

        // Escrevendo no editor
        editor.escrever("Olá, ");
        historico.salvarMemento(editor.salvar());

        editor.escrever("mundo!");
        historico.salvarMemento(editor.salvar());

        editor.escrever(" Este é um editor de texto.");

        System.out.println("Texto atual: " + editor.mostrarTexto());

        // Desfazendo a última operação
        editor.desfazer(historico.desfazer());
        System.out.println("Após desfazer: " + editor.mostrarTexto());

        // Desfazendo novamente
        editor.desfazer(historico.desfazer());
        System.out.println("Após desfazer novamente: " + editor.mostrarTexto());
    }
}
