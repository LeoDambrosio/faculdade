package br.com.guilhermevillaca.padroes.exercicios.estrutural1;

/**
 *
 * @author guilherme.villaca
 *
 */
public class Principal {

    public static void main(String[] args) {

        // Notificação por e-mail criptografada e com log de auditoria
        Notificacao emailNotificacao = new EmailNotificacao();
        Notificacao emailComCriptografiaELog = new LogAuditorDecorator(
                new CriptografiaDecorator(emailNotificacao)
        );
        System.out.println(emailComCriptografiaELog.enviar("Mensagem confidencial"));

        // Notificação por SMS simples, sem decoradores
        Notificacao smsNotificacao = new SmsNotificacao();
        System.out.println(smsNotificacao.enviar("Mensagem simples"));

        Notificacao emailNot = new EmailNotificacao();
        System.out.println(emailNot.enviar("Mensagem email"));

        Notificacao appNot = new AppNotificacao();
        System.out.println(appNot.enviar("Mensagem app"));
    }
}
