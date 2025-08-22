package br.com.leonardovieira.antipadroes.estruturais.bridge;

public class TVComControleBasico {
    public void ligar() {
        System.out.println("TV ligada");
    }

    public void desligar() {
        System.out.println("TV desligada");
    }

    public void aumentarVolume() {
        System.out.println("Volume da TV aumentado");
    }
}