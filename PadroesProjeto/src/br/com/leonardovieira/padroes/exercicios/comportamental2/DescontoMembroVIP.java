package br.com.guilhermevillaca.padroes.exercicios.comportamental2;

/**
 *
 * @author guilherme.villaca
 */
public class DescontoMembroVIP implements EstrategiaDesconto {

    @Override
    public double calcularDesconto(double valor) {
        return valor * 0.20; // 20% de desconto para membros VIP
    }
}
