package br.com.leonardovieira.padroes.comportamentais.state;


// Estado SemMoeda: A máquina está esperando uma moeda
public class SemMoedaState implements State {
    private MaquinaVenda maquinaVenda;

    public SemMoedaState(MaquinaVenda maquinaVenda) {
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
        System.out.println("Você precisa inserir uma moeda primeiro.");
    }

    @Override
    public void dispensarProduto() {
        System.out.println("Nenhum produto dispensado.");
    }
}