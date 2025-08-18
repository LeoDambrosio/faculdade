package br.com.guilhermevillaca.antipadroes.criacionais.factorymethod;

// Implementação específica para transporte ferroviário
class Trem extends Transporte {
    @Override
    public void entregar() {
        System.out.println("Entrega sendo feita por trem.");
    }
}