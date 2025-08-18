package br.com.guilhermevillaca.padroes.estruturais.facade;

public class Player {

    void ligar() {
        System.out.println("Reprodutor de mídia ligado.");
    }

    void reproduzirFilme(String filme) {
        System.out.println("Reproduzindo: " + filme);
    }

}
