package br.com.guilhermevillaca.antipadroes.estruturais.decorator;

// ☕ Capuccino
public class Capuccino extends Cafe {
    @Override
    public double getPreco() {
        return super.getPreco() + 4.00;
    }

    @Override
    public String getDescricao() {
        return "Capuccino";
    }
}