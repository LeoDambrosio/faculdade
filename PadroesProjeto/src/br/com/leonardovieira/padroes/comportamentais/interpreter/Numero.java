package br.com.leonardovieira.padroes.comportamentais.interpreter;

// Expressão para números (valores fixos)
public class Numero implements Expressao {
    private int numero;

    public Numero(int numero) {
        this.numero = numero;
    }

    @Override
    public int interpretar() {
        return numero;
    }
}