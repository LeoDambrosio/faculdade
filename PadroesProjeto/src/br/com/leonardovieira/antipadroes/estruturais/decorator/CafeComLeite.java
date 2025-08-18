package br.com.guilhermevillaca.antipadroes.estruturais.decorator;

// ☕ Café com leite
public class CafeComLeite extends Cafe {
    @Override
    public double getPreco() {
        return super.getPreco() + 2.00;
    }

    @Override
    public String getDescricao() {
        return super.getDescricao() + " com leite";
    }
}