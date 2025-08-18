package br.com.guilhermevillaca.padroes.estruturais.decorator;

// 🌿 Decorador para adoçante
public class Adocante extends CafeDecorator {
    public Adocante(Cafe cafe) {
        super(cafe);
    }

    @Override
    public double getPreco() {
        return super.getPreco() + 1.50;
    }

    @Override
    public String getDescricao() {
        return super.getDescricao() + " com adoçante";
    }
}