package br.com.guilhermevillaca.padroes.criacionais.exercicios.atv2;

/**
 *
 * @author villaca
 */
public interface FabricaJogo {
    public JogoCartas criarJogoCartas();
    public JogoTabuleiro criarJogoTabuleiro();
}
