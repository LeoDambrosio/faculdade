package br.com.guilhermevillaca.padroes.comportamentais.visitor_;

/**
 *
 * @author guilherme.villaca
 */
public class Fruta implements Item {

    private String nome;
    private double peso;
    private double precoPorKg;

    public Fruta(String nome, double peso, double precoPorKg) {
        this.nome = nome;
        this.peso = peso;
        this.precoPorKg = precoPorKg;
    }

    public String getNome() {
        return nome;
    }

    public double getPeso() {
        return peso;
    }

    public double getPrecoPorKg() {
        return precoPorKg;
    }

    @Override
    public void aceitar(Visitante visitante) {
        visitante.visitar(this);
    }
}
