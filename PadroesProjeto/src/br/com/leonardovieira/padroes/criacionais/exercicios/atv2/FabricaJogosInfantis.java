package br.com.guilhermevillaca.padroes.criacionais.exercicios.atv2;

/**
 *
 * @author villaca
 */
public class FabricaJogosInfantis implements FabricaJogo{

    @Override
    public JogoCartas criarJogoCartas() {
        return new JogoCartasInfantil();
    }

    @Override
    public JogoTabuleiro criarJogoTabuleiro() {
        return new JogoTabuleiroInfantil();
    }

}
