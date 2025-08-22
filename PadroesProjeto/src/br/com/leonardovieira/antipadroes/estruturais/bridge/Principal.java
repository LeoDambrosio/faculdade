package br.com.leonardovieira.antipadroes.estruturais.bridge;

public class Principal {
    public static void main(String[] args) {
        TVComControleBasico tvBasica = new TVComControleBasico();
        tvBasica.ligar();
        tvBasica.aumentarVolume();

        RadioComControleAvancado radioAvancado = new RadioComControleAvancado();
        radioAvancado.ligar();
        radioAvancado.sintonizarEstacao(101.3);
    }
}





