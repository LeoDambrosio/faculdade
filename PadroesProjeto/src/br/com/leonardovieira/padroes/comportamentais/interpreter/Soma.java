package br.com.leonardovieira.padroes.comportamentais.interpreter;

// Expressão para soma
public class Soma implements Expressao {
    private Expressao esquerda, direita;

    public Soma(Expressao esquerda, Expressao direita) {
        this.esquerda = esquerda;
        this.direita = direita;
    }

    @Override
    public int interpretar() {
        return esquerda.interpretar() + direita.interpretar();
    }
}
