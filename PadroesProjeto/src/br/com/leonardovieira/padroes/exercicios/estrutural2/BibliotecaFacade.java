package br.com.guilhermevillaca.padroes.exercicios.estrutural2;

/**
 *
 * @author guilherme.villaca
 */
public class BibliotecaFacade {

    private CatalogoDeLivros catalogo;
    private RegistroDeUsuarios registro;
    private GerenciamentoDeEmprestimos gerenciamento;
    private Notificacoes notificacoes;

    public BibliotecaFacade() {
        catalogo = new CatalogoDeLivros();
        registro = new RegistroDeUsuarios();
        gerenciamento = new GerenciamentoDeEmprestimos();
        notificacoes = new Notificacoes();
    }

    public void buscarELocarLivro(String tituloLivro, String nomeUsuario) {
        if (catalogo.buscarLivro(tituloLivro) && registro.usuarioExistente(nomeUsuario)) {
            gerenciamento.emprestarLivro(tituloLivro, nomeUsuario);
            notificacoes.enviarNotificacao(nomeUsuario, "Seu livro '" + tituloLivro + "' foi emprestado com sucesso.");
        } else {
            System.out.println("Não foi possível realizar o empréstimo.");
        }
    }

    public void registrarNovoUsuario(String nomeUsuario) {
        registro.registrarUsuario(nomeUsuario);
        notificacoes.enviarNotificacao(nomeUsuario, "Seu registro foi realizado com sucesso.");
    }

    public void devolverLivro(String tituloLivro, String nomeUsuario) {
        gerenciamento.devolverLivro(tituloLivro, nomeUsuario);
        notificacoes.enviarNotificacao(nomeUsuario, "Seu livro '" + tituloLivro + "' foi devolvido com sucesso.");
    }
}
