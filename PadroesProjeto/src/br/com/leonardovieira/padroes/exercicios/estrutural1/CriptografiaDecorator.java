package br.com.guilhermevillaca.padroes.exercicios.estrutural1;

/**
 *
 * @author guilherme.villaca
 */
public class CriptografiaDecorator implements Notificacao {

    protected Notificacao notificacao;

    public CriptografiaDecorator(Notificacao notificacao) {
        this.notificacao = notificacao;
    }

    @Override
    public String enviar(String mensagem) {
        String mensagemCriptografada = criptografar(mensagem);
        return mensagemCriptografada;
    }

    private String criptografar(String mensagem) {
        // Simulação de criptografia simples
        return new StringBuilder(mensagem).reverse().toString();
    }

}
