package br.com.guilhermevillaca.padroes.comportamentais.mediator;

/**
 *
 * @author villaca
 */
public abstract class Colaborador {
    protected Mediador mediador;
    protected String nome;

    public Colaborador(Mediador mediador, String nome) {
        this.mediador = mediador;
        this.nome = nome;
        mediador.adicionarColaborador(this);
    }

    public abstract void enviarMensagem(String mensagem);
    public abstract void receberMensagem(String mensagem);
}