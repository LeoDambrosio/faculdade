package br.com.leonardovieira.padroes.comportamentais.interpreter;

// Expressão para subtração
public class Subtracao implements Expressao {
    private Expressao esquerda, direita;

    public Subtracao(Expressao esquerda, Expressao direita) {
        this.esquerda = esquerda;
        this.direita = direita;
    }

    @Override
    public int interpretar() {
        return esquerda.interpretar() - direita.interpretar();
    }
}