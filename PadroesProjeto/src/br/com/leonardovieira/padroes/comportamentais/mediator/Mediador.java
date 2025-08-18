package br.com.leonardovieira.padroes.comportamentais.mediator;


public interface Mediador {

    void enviarMensagem(String mensagem, Colaborador colaborador);

    void adicionarColaborador(Colaborador colaborador);
}
