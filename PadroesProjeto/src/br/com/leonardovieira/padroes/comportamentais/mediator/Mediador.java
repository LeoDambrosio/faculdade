package br.com.guilhermevillaca.padroes.comportamentais.mediator;

/**
 *
 * @author villaca
 */
public interface Mediador {

    void enviarMensagem(String mensagem, Colaborador colaborador);

    void adicionarColaborador(Colaborador colaborador);
}
