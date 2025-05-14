package br.com.leonardovieira.exercicio7;

public class Smartphone extends Eletronico {
    private String sistemaOperacional;

    public Smartphone(String marca, String modelo, String sistemaOperacional) {
        super(marca, modelo);
        this.sistemaOperacional = sistemaOperacional;
    }

    @Override
    public void ligar() {
        System.out.println("Smartphone da marca " + marca + " modelo " + modelo +
                           " ligado com sistema " + sistemaOperacional);
    }
}
