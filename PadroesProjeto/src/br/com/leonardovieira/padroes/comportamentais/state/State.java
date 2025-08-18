package br.com.leonardovieira.padroes.comportamentais.state;


// Interface State que define o comportamento para cada estado da máquina
public interface State {

    void inserirMoeda();

    void ejetarMoeda();

    void acionarAlavanca();

    void dispensarProduto();
}
