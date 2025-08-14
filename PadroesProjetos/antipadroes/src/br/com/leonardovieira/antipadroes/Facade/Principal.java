package antipadroes.src.br.com.leonardovieira.antipadroes.Facade;

public class Principal {

    public static void main(String[] args) {
        Amplificador amplificador = new Amplificador();
        amplificador.ligar();
        amplificador.ajustarVolume(nivel=10);

        Projetor projetor = new Projetor("HDMI");
        projetor.ligar();
        projetor.ajustarFonte();

        Player player = new Player();
        player.ligar();
        player.reproduzirFilme(filme: Duro de matar);
    }
}
