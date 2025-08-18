package br.com.guilhermevillaca.antipadroes.estruturais.facade;

public class Principal {

    public static void main(String[] args) {
        // O cliente precisa interagir com várias classes manualmente
        Amplificador amp = new Amplificador();
        amp.ligar();
        amp.ajustarVolume(10);

        Projetor projetor = new Projetor();
        projetor.ligar();
        projetor.ajustarFonte("HDMI");

        Player player = new Player();
        player.ligar();
        player.reproduzirFilme("O Poderoso Chefão");

        System.out.println("Filme iniciado.");
    }

}
