package br.com.leonardovieira.padroes.criacionais.builder;
 
public class Casa {
    private String paredes;
    private String telhado;
    private String portas;
    private String janelas;

    // Métodos getters
    public String getParedes() {
        return paredes;
    }

    public String getTelhado() {
        return telhado;
    }

    public String getPortas() {
        return portas;
    }

    public String getJanelas() {
        return janelas;
    }

    // Construtor privado
    private Casa() {}

    // Construtor que aceita um Builder
    public Casa(Builder builder) {
        this.paredes = builder.paredes;
        this.telhado = builder.telhado;
        this.portas = builder.portas;
        this.janelas = builder.janelas;
    }
}
