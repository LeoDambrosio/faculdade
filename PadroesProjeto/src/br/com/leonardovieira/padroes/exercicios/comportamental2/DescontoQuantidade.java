package br.com.guilhermevillaca.padroes.exercicios.comportamental2;

/**
 *
 * @author guilherme.villaca
 */
public class DescontoQuantidade implements EstrategiaDesconto {

    private int quantidade;

    public DescontoQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    @Override
    public double calcularDesconto(double valor) {
        if (quantidade > 10) {
            return valor * 0.10; // 10% de desconto para mais de 10 itens
        }
        return 0;
    }
}
