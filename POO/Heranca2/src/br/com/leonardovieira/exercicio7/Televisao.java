package br.com.leonardovieira.exercicio7;

public class Televisao extends Eletronico {
    private int tamanhoTela;

    public Televisao(String marca, String modelo, int tamanhoTela) {
        super(marca, modelo);
        this.tamanhoTela = tamanhoTela;
    }

    @Override
    public void ligar() {
        System.out.println("TV de " + tamanhoTela + " polegadas da marca " + marca +
                           " modelo " + modelo + " ligada");
    }
}
