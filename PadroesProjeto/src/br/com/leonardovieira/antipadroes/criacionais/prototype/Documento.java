package br.com.guilhermevillaca.antipadroes.criacionais.prototype;

public class Documento {
    private String titulo;
    private String conteudo;

    public Documento(String titulo, String conteudo) {
        this.titulo = titulo;
        this.conteudo = conteudo;
    }

    public void exibir() {
        System.out.println("Título: " + titulo);
        System.out.println("Conteúdo: " + conteudo);
    }

    // Método para "clonar" um documento (problema: código duplicado)
    public Documento copiar() {
        return new Documento(this.titulo, this.conteudo); // Cópia manual
    }
}
