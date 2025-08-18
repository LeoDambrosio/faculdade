package br.com.guilhermevillaca.padroes.estruturais.decorator;

// 🎨 Decorador abstrato para ingredientes adicionais
public abstract class CafeDecorator implements Cafe {
    protected Cafe cafe;

    public CafeDecorator(Cafe cafe) {
        this.cafe = cafe;
    }

    @Override
    public double getPreco() {
        return cafe.getPreco();
    }

    @Override
    public String getDescricao() {
        return cafe.getDescricao();
    }
}
