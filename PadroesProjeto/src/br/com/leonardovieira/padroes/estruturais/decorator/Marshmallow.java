package br.com.leonardovieira.padroes.estruturais.decorator;

// 🍡 Decorador para Marshmallow
public class Marshmallow extends CafeDecorator {
    public Marshmallow(Cafe cafe) {
        super(cafe);
    }

    @Override
    public double getPreco() {
        return super.getPreco() + 2.00;
    }

    @Override
    public String getDescricao() {
        return super.getDescricao() + " com marshmallow";
    }
}
