package br.com.guilhermevillaca.padroes.criacionais.exercicios.atv2;

/**
 *
 * @author villaca
 */
public class FabricaJogosAdultos implements FabricaJogo{

    @Override
    public JogoCartas criarJogoCartas() {
        return new JogoCartasAdulto();
    }

    @Override
    public JogoTabuleiro criarJogoTabuleiro() {
        return new JogoTabuleiroAdulto();
    }

}
