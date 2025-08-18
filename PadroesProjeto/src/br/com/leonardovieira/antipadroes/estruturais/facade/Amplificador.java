package br.com.guilhermevillaca.antipadroes.estruturais.facade;

public class Amplificador {

    void ligar() {
        System.out.println("Amplificador ligado.");
    }

    void ajustarVolume(int nivel) {
        System.out.println("Volume ajustado para " + nivel);
    }

}
