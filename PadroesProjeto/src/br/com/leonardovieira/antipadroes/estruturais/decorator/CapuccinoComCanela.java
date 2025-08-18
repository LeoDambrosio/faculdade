package br.com.guilhermevillaca.antipadroes.estruturais.decorator;

// ☕ Capuccino com canela
public class CapuccinoComCanela extends Capuccino {
    @Override
    public double getPreco() {
        return super.getPreco() + 1.50;
    }

    @Override
    public String getDescricao() {
        return super.getDescricao() + " com canela";
    }
}