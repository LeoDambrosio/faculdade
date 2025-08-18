package br.com.leonardovieira.padroes.comportamentais.state;


// Estado ComMoeda: A máquina recebeu uma moeda
public class ComMoedaState implements State {
    private MaquinaVenda maquinaVenda;

    public ComMoedaState(MaquinaVenda maquinaVenda) {
        this.maquinaVenda = maquinaVenda;
    }

    @Override
    public void inserirMoeda() {
        System.out.println("Já existe uma moeda inserida.");
    }

    @Override
    public void ejetarMoeda() {
        System.out.println("Moeda ejetada.");
        maquinaVenda.setEstado(maquinaVenda.getSemMoedaState());
    }

    @Override
    public void acionarAlavanca() {
        System.out.println("Alavanca acionada...");
        maquinaVenda.setEstado(maquinaVenda.getVendendoState());
    }

    @Override
    public void dispensarProduto() {
        System.out.println("Nenhum produto dispensado.");
    }
}