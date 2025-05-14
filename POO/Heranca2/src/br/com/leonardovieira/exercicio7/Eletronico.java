package br.com.leonardovieira.exercicio7;

public abstract class Eletronico {
    protected String marca;
    protected String modelo;

    public Eletronico(String marca, String modelo) {
        this.marca = marca;
        this.modelo = modelo;
    }

    public abstract void ligar();
}

