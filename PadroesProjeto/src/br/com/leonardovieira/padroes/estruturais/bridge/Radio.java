package br.com.guilhermevillaca.padroes.estruturais.bridge;

/**
 *
 * @author villaca
 */
public class Radio implements Dispositivo {

    @Override
    public void ligar() {
        System.out.println("Rádio ligado");
    }

    @Override
    public void desligar() {
        System.out.println("Rádio desligado");
    }

    @Override
    public void aumentarVolume() {
        System.out.println("Volume do Rádio aumentado");
    }
}
