package br.com.leonardovieira.antipadroes.estruturais.bridge;

public class TVComControleAvancado {
    public void ligar() {
        System.out.println("TV ligada");
    }

    public void desligar() {
        System.out.println("TV desligada");
    }

    public void aumentarVolume() {
        System.out.println("Volume da TV aumentado");
    }

    public void mudarCanal(int canal) {
        System.out.println("TV mudou para o canal " + canal);
    }
}