package br.com.leonardovieira.antipadroes.comportamentais.command;

public class Principal {

    public static void main(String[] args) {
        Garcom garcom = new Garcom();
        garcom.fazerPedido("pizza");
        garcom.fazerPedido("hamburguer");
    }

}
