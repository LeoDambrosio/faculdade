package br.com.guilhermevillaca.padroes.comportamentais.observer;

/**
 *
 * @author villaca
 */
// Interface Observer que define o método de notificação
public interface Observer {

    void atualizar(String nomeProduto, int quantidade);
}
