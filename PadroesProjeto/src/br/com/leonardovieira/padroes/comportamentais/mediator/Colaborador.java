package br.com.leonardovieira.padroes.comportamentais.mediator;


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