package br.com.guilhermevillaca.padroes.comportamentais.state;

/**
 *
 * @author villaca
 */
// Interface State que define o comportamento para cada estado da máquina
public interface State {

    void inserirMoeda();

    void ejetarMoeda();

    void acionarAlavanca();

    void dispensarProduto();
}
