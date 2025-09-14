package br.com.guilhermevillaca.padroes.estruturais.facade;

public class HomeTheaterFacade {

    private Amplificador amp;
    private Projetor projetor;
    private Player player;

    public HomeTheaterFacade(Amplificador amp, Projetor projetor, Player player) {
        this.amp = amp;
        this.projetor = projetor;
        this.player = player;
    }

    public void assistirFilme(String filme) {
        System.out.println("\nPreparando o sistema de Home Theater...");
        amp.ligar();
        amp.ajustarVolume(10);
        projetor.ligar();
        projetor.ajustarFonte("HDMI");
        player.ligar();
        player.reproduzirFilme(filme);
        System.out.println("Filme iniciado!");
    }

}
