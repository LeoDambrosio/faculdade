package br.com.guilhermevillaca.antipadroes.criacionais.builder;
class Casa {
    private String paredes;
    private String telhado;
    private int portas;
    private int janelas;

    // Construtor longo para inicializar tudo de uma vez
    public Casa(String paredes, String telhado, int portas, int janelas) {
        this.paredes = paredes;
        this.telhado = telhado;
        this.portas = portas;
        this.janelas = janelas;
    }

    // Método para exibir os detalhes da casa
    public void mostrarDetalhes() {
        System.out.println("Casa com " + paredes + ", " + telhado + ", " + portas + " portas e " + janelas + " janelas.");
    }
}