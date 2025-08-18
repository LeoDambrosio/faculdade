package br.com.guilhermevillaca.padroes.estruturais.bridge;

// 📽️ Implementação para Projetor (novo dispositivo)
public class Projetor implements Dispositivo {
    @Override
    public void ligar() {
        System.out.println("Projetor ligado");
    }

    @Override
    public void desligar() {
        System.out.println("Projetor desligado");
    }

    @Override
    public void aumentarVolume() {
        System.out.println("Brilho do projetor aumentado");
    }

    public void mudarFonte(String fonte) {
        System.out.println("Projetor mudando para a fonte: " + fonte);
    }
}
