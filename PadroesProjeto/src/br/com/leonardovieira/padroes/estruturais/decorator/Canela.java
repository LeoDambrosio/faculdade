package br.com.guilhermevillaca.padroes.estruturais.decorator;

// 🍂 Decorador para Canela
public class Canela extends CafeDecorator {
    public Canela(Cafe cafe) {
        super(cafe);
    }

    @Override
    public double getPreco() {
        return super.getPreco() + 1.50;
    }

    @Override
    public String getDescricao() {
        return super.getDescricao() + " com canela";
    }
}