package br.com.leonardovieira.antipadroes.estruturais.decorator;

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