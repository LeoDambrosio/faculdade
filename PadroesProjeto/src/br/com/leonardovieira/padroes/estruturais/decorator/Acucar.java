package br.com.guilhermevillaca.padroes.estruturais.decorator;

// 🍬 Decorador para açúcar
public class Acucar extends CafeDecorator {
    public Acucar(Cafe cafe) {
        super(cafe);
    }

    @Override
    public double getPreco() {
        return super.getPreco() + 1.00;
    }

    @Override
    public String getDescricao() {
        return super.getDescricao() + " com açúcar";
    }
}
