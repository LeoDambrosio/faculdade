package br.com.leonardovieira.padroes.comportamentais.interpreter;

public class OrExpressao implements Expressao{

    private Expressao esquerda;
    private Expressao direita;

    public OrExpressao(Expressao esquerda, Expressao direita){
        this.esquerda = esquerda;
        this.direita =direita;
    }

    @Override
    public boolean interpretar(Artigo artigo){
        return esquerda.interpretar(artigo) && direita.interpretar(artigo);
    } {

    }
}