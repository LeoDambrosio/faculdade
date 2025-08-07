package antipadroes.src.br.com.leonardovieira.antipadroes.estruturais;

public abstract class ControleRemoto {

    protected Dispositivo dispositivo;

    public ControleRemoto(Dispositivo dispositivo){
        this.dispositivo = dispositivo;
    }

    public void ligar(){
        dispositivo.ligar();
    }

    public void desligar(){
        dispositivo.desligar();
    }

    public void aumentarVolume(){
        dispositivo.aumentarVolume();
    }


}
