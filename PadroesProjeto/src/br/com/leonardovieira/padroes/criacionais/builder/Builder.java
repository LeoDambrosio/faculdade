package br.com.leonardovieira.padroes.criacionais.builder;
 
// Classe estática Builder
public class Builder {
    String paredes;
    String telhado;
    String portas;
    String janelas;

    public Builder comParedes(String paredes) {
        this.paredes = paredes;
        return this;
    }

    public Builder comTelhado(String telhado) {
        this.telhado = telhado;
        return this;
    }

    public Builder comPortas(String portas) {
        this.portas = portas;
        return this;
    }

    public Builder comJanelas(String janelas) {
        this.janelas = janelas;
        return this;
    }

    public Casa build() {
        return new Casa(this);
    }
}
