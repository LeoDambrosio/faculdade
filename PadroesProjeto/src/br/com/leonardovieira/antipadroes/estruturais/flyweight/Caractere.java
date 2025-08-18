package br.com.guilhermevillaca.antipadroes.estruturais.flyweight;

public class Caractere {

    private char simbolo;
    private String fonte;
    private int tamanho;

    public Caractere(char simbolo, String fonte, int tamanho) {
        this.simbolo = simbolo;
        this.fonte = fonte;
        this.tamanho = tamanho;
    }

    public void exibir() {
        System.out.println("Caractere: " + simbolo + " | Fonte: " + fonte + " | Tamanho: " + tamanho);
    }

}
