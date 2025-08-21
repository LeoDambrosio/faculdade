package br.com.leonardovieira.padroes.comportamentais.mediator;


public class Principal {

    public static void main(String[] args) {
        Mediador mediador = new MediadorConcreto();

        Colaborador colaborador1 = new ColaboradorConcreto(mediador, "Leonardo");
        Colaborador colaborador2 = new ColaboradorConcreto(mediador, "Andre");
        Colaborador colaborador3 = new ColaboradorConcreto(mediador, "Henrique");

        colaborador1.enviarMensagem("Olá a todos!");
        colaborador2.enviarMensagem("Oi, Leonardo!");
        colaborador3.enviarMensagem("Oi, pessoal!");
    }
}
