package br.com.leonardovieira.padroes.comportamentais.mediator;


public class Principal {

    public static void main(String[] args) {
        Mediador mediador = new MediadorConcreto();

        Colaborador colaborador1 = new ColaboradorConcreto(mediador, "Guilherme");
        Colaborador colaborador2 = new ColaboradorConcreto(mediador, "Patricia");
        Colaborador colaborador3 = new ColaboradorConcreto(mediador, "Luis");

        colaborador1.enviarMensagem("Olá a todos!");
        colaborador2.enviarMensagem("Oi, Guilherme!");
        colaborador3.enviarMensagem("Oi, pessoal!");
    }
}
