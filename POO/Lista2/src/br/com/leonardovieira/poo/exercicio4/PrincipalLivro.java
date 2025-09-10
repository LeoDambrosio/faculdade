package br.com.leonardovieira.poo.exercicio4;

public class PrincipalLivro {
    public static void main(String[] args) {

        Livro livro1 = new Livro("A Menina que Roubava Livros", "Markus Zusak", 2005);
        Livro livro2 = new Livro("Capitães da Areia", "Jorge Amado", 1937);
        Livro livro3 = new Livro("O Alquimista", "Paulo Coelho", 1988);

        livro1.exibirInformacoes();
        livro2.exibirInformacoes();
        livro3.exibirInformacoes();
    }
}
