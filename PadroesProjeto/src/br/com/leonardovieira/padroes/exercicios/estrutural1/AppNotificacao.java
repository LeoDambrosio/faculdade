package br.com.guilhermevillaca.padroes.exercicios.estrutural1;

/**
 *
 * @author guilherme.villaca
 */
public class AppNotificacao implements Notificacao{
    
    @Override
    public String enviar(String mensagem){
        return "mensagem do app " + mensagem;
    }
}
