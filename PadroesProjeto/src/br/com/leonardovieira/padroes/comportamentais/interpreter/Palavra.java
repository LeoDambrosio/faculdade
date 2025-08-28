package br.com.leonardovieira.padroes.comportamentais.interpreter;

import java.util.function.BooleanSupplier;

import br.com.leonardovieira.padroes.comportamentais.interpreter.Expressao;

public class Palavra implements Expressao {

    private String termo;

    public Palavra(String termo){
        this.termo = termo.toLowerCase();
    }

    @Override
    public boolean interpretar(Artigo artigo) {
        return artigo.getTitulo().contains(termo);
    }

}
