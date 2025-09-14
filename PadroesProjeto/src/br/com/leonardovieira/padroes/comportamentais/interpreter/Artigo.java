package br.com.leonardovieira.padroes.comportamentais.interpreter;

public class Artigo {
    private String titulo;

    public Artigo(String titulo){
        this.titulo = titulo.toLowerCase();
    }
    public String getTitulo(){
        return titulo;
    }
    public void setTitulo(String titulo){
        this.titulo = titulo;
    }
}
