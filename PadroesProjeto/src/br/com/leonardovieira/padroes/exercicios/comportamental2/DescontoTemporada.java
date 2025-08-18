package br.com.guilhermevillaca.padroes.exercicios.comportamental2;

/**
 *
 * @author guilherme.villaca
 */
public class DescontoTemporada implements EstrategiaDesconto {

    private String temporada;

    public DescontoTemporada(String temporada) {
        this.temporada = temporada;
    }

    @Override
    public double calcularDesconto(double valor) {
        if ("verão".equalsIgnoreCase(temporada)) {
            return valor * 0.15; // 15% de desconto no verão
        }
        return 0;
    }
}
