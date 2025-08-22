package br.com.leonardovieira.antipadroes.estruturais.decorator;

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