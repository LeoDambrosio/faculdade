package br.com.leonardovieira.antipadroes.estruturais;

public class TVComControleAvancado {
    public void ligar(){
        System.out.println("TV Ligada");
    }

    public void desligar(){
        System.out.println("TV Desligada");
    }

    public void aumentarVolume(){
        System.err.println("Volume da TV aumentado");
    }

    public void mudarCanal(int canal){
        System.err.println("A TV mudou para" + canal);
    }
}
