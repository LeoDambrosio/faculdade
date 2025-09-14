package br.com.guilhermevillaca.padroes.exercicios.estrutural2;

/**
 *
 * @author guilherme.villaca
 * 
 * Explicação: 
 *
 * CatalogoDeLivros: Gerencia a adição e busca de livros. 
 * RegistroDeUsuarios:
 * Cuida do registro de novos usuários e verificação de usuários existentes.
 * GerenciamentoDeEmprestimos: Gerencia o empréstimo e devolução de livros.
 * Notificacoes: Envia notificações para os usuários. Façade:
 *
 * BibliotecaFacade: Oferece uma interface para interagir com os
 * subsistemas. Métodos como buscarELocarLivro, registrarNovoUsuario, e
 * devolverLivro abstraem a complexidade dos subsistemas e oferecem uma
 * interface clara e simplificada. 
 * 
 * Exemplo de Uso: No método main, um novo usuário é registrado, um livro é buscado e
 * emprestado, e então o livro é devolvido.
 */
public class Principal {

    public static void main(String[] args) {
        BibliotecaFacade biblioteca = new BibliotecaFacade();

        // Registrar novo usuário
        biblioteca.registrarNovoUsuario("João Silva");

        // Buscar e emprestar livro
        biblioteca.buscarELocarLivro("Java para Iniciantes", "João Silva");

        // Devolver livro
        biblioteca.devolverLivro("Java para Iniciantes", "João Silva");
    }
}
