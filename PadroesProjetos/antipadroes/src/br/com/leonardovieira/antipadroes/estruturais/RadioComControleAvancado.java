package br.com.leonardovieira.antipadroes.estruturais;

public class RadioComControleAvancado {
    public void ligar(){
        System.out.println("Radio Ligada");
    }

    public void desligar(){
        System.out.println("Radio Desligada");
    }

    public void aumentarVolume(){
        System.err.println("Volume do Radio aumentado");
    }

    public void mudarEstacao(double estacao){
        System.err.println("Radio sincronizado na estacao" + estacao + "MHz");
    }
}
