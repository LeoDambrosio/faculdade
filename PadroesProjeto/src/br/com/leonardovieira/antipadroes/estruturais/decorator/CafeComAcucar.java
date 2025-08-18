package br.com.guilhermevillaca.antipadroes.estruturais.decorator;

// ☕ Café com açúcar
public class CafeComAcucar extends Cafe {
    @Override
    public double getPreco() {
        return super.getPreco() + 1.00;
    }

    @Override
    public String getDescricao() {
        return super.getDescricao() + " com açúcar";
    }
}