package br.com.guilhermevillaca.padroes.estruturais.facade;

public class Projetor {

    void ligar() {
        System.out.println("Projetor ligado.");
    }

    void ajustarFonte(String fonte) {
        System.out.println("Fonte do projetor ajustada para " + fonte);
    }

}
