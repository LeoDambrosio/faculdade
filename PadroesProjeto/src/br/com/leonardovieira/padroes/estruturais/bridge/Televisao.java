package br.com.guilhermevillaca.padroes.estruturais.bridge;

/**
 *
 * @author villaca
 */
public class Televisao implements Dispositivo {

    @Override
    public void ligar() {
        System.out.println("TV ligada");
    }

    @Override
    public void desligar() {
        System.out.println("TV desligada");
    }

    @Override
    public void aumentarVolume() {
        System.out.println("Volume da TV aumentado");
    }

}
