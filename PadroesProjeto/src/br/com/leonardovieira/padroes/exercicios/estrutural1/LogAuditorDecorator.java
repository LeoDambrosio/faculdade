package br.com.guilhermevillaca.padroes.exercicios.estrutural1;

/**
 *
 * @author guilherme.villaca
 */
public class LogAuditorDecorator implements Notificacao {

    protected Notificacao notificacao;

    public LogAuditorDecorator(Notificacao notificacao) {
        this.notificacao = notificacao;
    }

    @Override
    public String enviar(String mensagem) {
        logAuditoria(mensagem);
        return "log registrado";
    }

    private void logAuditoria(String mensagem) {
        System.out.println("Log de auditoria: " + mensagem);
    }

}
