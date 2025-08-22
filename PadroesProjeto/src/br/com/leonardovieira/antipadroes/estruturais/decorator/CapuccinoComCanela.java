package br.com.leonardovieira.antipadroes.estruturais.decorator;

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