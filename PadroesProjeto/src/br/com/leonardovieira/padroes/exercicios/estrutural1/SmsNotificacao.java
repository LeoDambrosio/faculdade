package br.com.guilhermevillaca.padroes.exercicios.estrutural1;

/**
 *
 * @author guilherme.villaca
 */
public class SmsNotificacao implements Notificacao {

    @Override
    public String enviar(String mensagem) {
        return "mensagem do SMS " + mensagem;
    }

}
