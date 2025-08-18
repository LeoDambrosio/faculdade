package br.com.leonardovieira.padroes.comportamentais.mediator;

/**
 *
 *
 *
 * O padrão de projeto Mediator é utilizado para reduzir as dependências entre
 * os objetos, promovendo um design mais flexível e fácil de manter. Ele
 * introduz um objeto mediador que centraliza a comunicação entre diferentes
 * componentes, de forma que esses componentes não se comuniquem diretamente
 * entre si, mas através do mediador.
 *
 * Explicação: Mediador.java: Interface que define as operações para enviar
 * mensagens e adicionar colaboradores.
 *
 * MediadorConcreto.java: Implementação da interface Mediador. Ele gerencia a
 * lista de colaboradores e centraliza a comunicação entre eles. Quando um
 * colaborador envia uma mensagem, o mediador a distribui para todos os outros
 * colaboradores, exceto o remetente.
 *
 * Colaborador.java: Classe abstrata que define a estrutura básica dos
 * colaboradores. Cada colaborador tem uma referência ao mediador e métodos para
 * enviar e receber mensagens.
 *
 * ColaboradorConcreto.java: Implementação concreta de um colaborador. Ele usa o
 * mediador para enviar mensagens e recebe mensagens de outros colaboradores
 * através do mediador.
 *
 * Cliente.java: A classe cliente onde o mediador e os colaboradores são
 * criados. Aqui, os colaboradores enviam mensagens uns para os outros através
 * do mediador.
 */
public class ColaboradorConcreto extends Colaborador {

    public ColaboradorConcreto(Mediador mediador, String nome) {
        super(mediador, nome);
    }

    @Override
    public void enviarMensagem(String mensagem) {
        System.out.println(this.nome + " enviou: " + mensagem);
        mediador.enviarMensagem(mensagem, this);
    }

    @Override
    public void receberMensagem(String mensagem) {
        System.out.println(this.nome + " recebeu: " + mensagem);
    }
}
