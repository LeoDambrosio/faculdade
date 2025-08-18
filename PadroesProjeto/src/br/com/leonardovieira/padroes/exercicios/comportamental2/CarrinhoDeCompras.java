package br.com.guilhermevillaca.padroes.exercicios.comportamental2;

/**
 *
 * @author guilherme.villaca
 */
public class CarrinhoDeCompras {

    private EstrategiaDesconto estrategiaDesconto;
    private double valorTotal;

    public CarrinhoDeCompras(double valorTotal) {
        this.valorTotal = valorTotal;
    }

    public void setEstrategiaDesconto(EstrategiaDesconto estrategia) {
        this.estrategiaDesconto = estrategia;
    }

    public double calcularValorFinal() {
        double desconto = estrategiaDesconto.calcularDesconto(valorTotal);
        return valorTotal - desconto;
    }
}
