package antipadroes.src.br.com.leonardovieira.antipadroes.estruturais;

import br.com.leonardovieira.antipadroes.estruturais.RadioComControleAvancado;
import br.com.leonardovieira.antipadroes.estruturais.TVComControleBasico;

public class Principal {
    public static void main(String[] args) {
        TVComControleBasico tvBasica = TVComControleBasico();
        tvBasica.ligar();
        tvBasica.aumentarVolume();

        RadioComControleAvancado radioAvancado = new RadioComControleAvancado();
        radioAvancado.ligar();
        radioAvancado.mudarEstacao(102.7);

    }
}
