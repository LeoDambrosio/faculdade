package br.com.leonardovieira.padroes.comportamentais.mediator;

public class ColaboradorConcreto extends Colaborador {

    public ColaboradorConcreto(Mediador mediador, String nome) {
        super(mediador, nome);
    }

    @Override
    public void enviarMensagem(String mensagem) {
        System.out.println(this.nome + " enviou: " + mensagem);
        mediador.enviarMensagem(mensagem, this);
    }

    @Override
    public void receberMensagem(String mensagem) {
        System.out.println(this.nome + " recebeu: " + mensagem);
    }
}
