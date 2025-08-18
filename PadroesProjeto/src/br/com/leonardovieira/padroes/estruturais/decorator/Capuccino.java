package br.com.guilhermevillaca.padroes.estruturais.decorator;

// ☕ Decorador para Capuccino
public class Capuccino extends CafeDecorator {
    public Capuccino(Cafe cafe) {
        super(cafe);
    }

    @Override
    public double getPreco() {
        return super.getPreco() + 4.00;
    }

    @Override
    public String getDescricao() {
        return "Capuccino";
    }
}
