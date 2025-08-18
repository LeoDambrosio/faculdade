package br.com.guilhermevillaca.padroes.estruturais.decorator;

// 🥛 Decorador para leite
public class Leite extends CafeDecorator {
    public Leite(Cafe cafe) {
        super(cafe);
    }

    @Override
    public double getPreco() {
        return super.getPreco() + 2.00;
    }

    @Override
    public String getDescricao() {
        return super.getDescricao() + " com leite";
    }
}
