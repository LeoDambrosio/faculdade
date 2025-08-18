package br.com.guilhermevillaca.padroes.estruturais.flyweight;

public class CaractereFlyweight {

    private char simbolo;
    private String fonte;
    private int tamanho;

    public CaractereFlyweight(char simbolo, String fonte, int tamanho) {
        this.simbolo = simbolo;
        this.fonte = fonte;
        this.tamanho = tamanho;
    }

    public void exibir() {
        System.out.println("Caractere: " + simbolo + " | Fonte: " + fonte + " | Tamanho: " + tamanho);
    }

}
