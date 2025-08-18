package br.com.guilhermevillaca.antipadroes.estruturais.bridge;

// 📻📡 Rádio com controle avançado
public class RadioComControleAvancado {
    public void ligar() {
        System.out.println("Rádio ligado");
    }

    public void desligar() {
        System.out.println("Rádio desligado");
    }

    public void aumentarVolume() {
        System.out.println("Volume do Rádio aumentado");
    }

    public void sintonizarEstacao(double estacao) {
        System.out.println("Rádio sintonizado na estação " + estacao + " MHz");
    }
}
