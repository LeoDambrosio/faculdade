package br.com.leonardovieira.antipadroes.criacionais.factorymethod;

public class Caminhao extends Transporte {
    @Override
    public void entregar() {
        System.out.println("Entrega sendo feita por caminhão.");
    }
}
