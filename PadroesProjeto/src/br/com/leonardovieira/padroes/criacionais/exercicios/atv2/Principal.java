package br.com.guilhermevillaca.padroes.criacionais.exercicios.atv2;

/**
 *
 * @author villaca
 */
public class Principal {
    public static void main(String[] args) {
        
        FabricaJogo fabricaAdulto = new FabricaJogosAdultos();
        JogoCartas jogoCartasAdulto = fabricaAdulto.criarJogoCartas();
        JogoTabuleiro jogoTabuleiroAdulto = fabricaAdulto.criarJogoTabuleiro();
        
        jogoCartasAdulto.embaralhar();
        jogoTabuleiroAdulto.jogar();
        
        FabricaJogo fabricaInfantil = new FabricaJogosInfantis();
        JogoCartas jogoCartasInfantil = fabricaInfantil.criarJogoCartas();
        JogoTabuleiro jogoTabuleiroInfantil = fabricaInfantil.criarJogoTabuleiro();
        
        jogoCartasInfantil.embaralhar();
        jogoTabuleiroInfantil.jogar();
        
    }

}
