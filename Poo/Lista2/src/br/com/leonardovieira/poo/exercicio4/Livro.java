package br.com.leonardovieira.poo.exercicio4;

public class Livro {
    private String titulo;
    private String autor;
    private int anoPublicacao;

    public Livro(String titulo, String autor, int anoPublicacao) {
        this.titulo = titulo;
        this.autor = autor;
        this.anoPublicacao = anoPublicacao;
    }

    public void exibirInformacoes() {
        System.out.println("Titulo: " + titulo);
        System.out.println("Autor: " + autor);
        System.out.println("Ano de Publicacao: " + anoPublicacao);
        System.out.println("--------------------------");
    }
}
