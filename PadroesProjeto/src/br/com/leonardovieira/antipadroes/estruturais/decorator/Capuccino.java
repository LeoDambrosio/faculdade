package br.com.leonardovieira.antipadroes.estruturais.decorator;

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