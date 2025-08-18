package br.com.leonardovieira.padroes.comportamentais.state;


// Estado Vendendo: A máquina está processando a venda
public class VendendoState implements State {
    private MaquinaVenda maquinaVenda;

    public VendendoState(MaquinaVenda maquinaVenda) {
        this.maquinaVenda = maquinaVenda;
    }

    @Override
    public void inserirMoeda() {
        System.out.println("Aguarde, já estamos processando uma venda.");
    }

    @Override
    public void ejetarMoeda() {
        System.out.println("Já estamos processando uma venda. Não é possível ejetar a moeda.");
    }

    @Override
    public void acionarAlavanca() {
        System.out.println("Alavanca já foi acionada.");
    }

    @Override
    public void dispensarProduto() {
        maquinaVenda.liberarProduto();
        if (maquinaVenda.getQuantidade() > 0) {
            maquinaVenda.setEstado(maquinaVenda.getSemMoedaState());
        } else {
            System.out.println("Produto esgotado!");
            maquinaVenda.setEstado(maquinaVenda.getSemEstoqueState());
        }
    }
}
