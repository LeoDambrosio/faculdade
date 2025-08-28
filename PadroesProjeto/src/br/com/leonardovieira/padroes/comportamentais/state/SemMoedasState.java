package br.com.leonardovieira.padroes.comportamentais.state;

public class SemMoedasState implements State {
    
    private MaquinaVenda maquinaVenda;

    public SemMoedasState(MaquinaVenda maquinaVenda) {
        this.maquinaVenda = maquinaVenda;
    }

    @Override
    public void inserirMoeda() {
        System.out.println("Moeda inserida.");
        maquinaVenda.setEstado(maquinaVenda.getComMoedaState());
    }

    @Override
    public void ejetarMoeda() {
        System.out.println("Nenhuma moeda foi inserida.");
    }

    @Override
    public void acionarAlavanca() {
        System.out.println("Voce precisa inserir uma moeda primeiro.");
    }

    @Override
    public void dispensarProduto() {
        System.out.println("Nenhum produto dispensado.");
    }
}