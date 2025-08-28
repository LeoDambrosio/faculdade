package br.com.leonardovieira.padroes.comportamentais.state;

public class SemEstoqueState implements State {
    private MaquinaVenda maquinaVenda;

    public SemEstoqueState(MaquinaVenda maquinaVenda) {
        this.maquinaVenda = maquinaVenda;
    }

    @Override
    public void inserirMoeda() {
        System.out.println("Produto esgotado. Nao e possivel inserir moeda.");
    }

    @Override
    public void ejetarMoeda() {
        System.out.println("Nenhuma moeda foi inserida.");
    }

    @Override
    public void acionarAlavanca() {
        System.out.println("Produto esgotado.");
    }

    @Override
    public void dispensarProduto() {
        System.out.println("Nenhum produto disponivel para ser dispensado.");
    }
}