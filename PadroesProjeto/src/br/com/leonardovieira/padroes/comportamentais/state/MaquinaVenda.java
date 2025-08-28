package br.com.leonardovieira.padroes.comportamentais.state;

public class MaquinaVenda {

    private State semMoedasState;
    private State comMoedasState;
    private State vendendoState;
    private State semEstoqueState;

    private State estadoAtual;
    private int quantidade;

    public MaquinaVenda(int quantidade) {
        semMoedasState = new SemMoedasState(this);
        comMoedasState = new ComMoedasState(this);
        vendendoState = new VendendoState(this);
        semEstoqueState = new SemEstoqueState(this);

        this.quantidade = quantidade;
        if (quantidade > 0) {
            estadoAtual = semMoedasState;
        } else {
            estadoAtual = semEstoqueState;
        }
    }

    public void inserirMoeda() {
        estadoAtual.inserirMoeda();
    }

    public void ejetarMoeda() {
        estadoAtual.ejetarMoeda();
    }

    public void acionarAlavanca() {
        estadoAtual.acionarAlavanca();
        estadoAtual.dispensarProduto();
    }

    public void setEstado(State novoEstado) {
        estadoAtual = novoEstado;
    }

    public void liberarProduto() {
        if (quantidade > 0) {
            System.out.println("Um produto foi dispensado.");
            quantidade--;
        }
    }

    public int getQuantidade() {
        return quantidade;
    }

    public State getSemMoedaState() {
        return semMoedasState;
    }

    public State getComMoedaState() {
        return comMoedasState;
    }

    public State getVendendoState() {
        return vendendoState;
    }

    public State getSemEstoqueState() {
        return semEstoqueState;
    }
}
