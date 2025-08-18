package br.com.guilhermevillaca.padroes.exercicios.estrutural2;

/**
 *
 * @author guilherme.villaca
 */
public class GerenciamentoDeEmprestimos {

    public void emprestarLivro(String titulo, String nomeUsuario) {
        System.out.println("Livro '" + titulo + "' emprestado para o usuário '" + nomeUsuario + "'.");
    }

    public void devolverLivro(String titulo, String nomeUsuario) {
        System.out.println("Livro '" + titulo + "' devolvido pelo usuário '" + nomeUsuario + "'.");
    }
}
