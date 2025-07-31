public class LoggerCom {
    // Instância única estática da classe
    private static Logger instanciaUnica;

    // Construtor privado impede criação de objetos fora da classe
    private LoggerCom() {
        System.out.println("Logger iniciado.");
    }

    // Método público que retorna a única instância
    public static Logger getInstancia() {
        if (instanciaUnica == null) {
            instanciaUnica = new Logger();
        }
        return instanciaUnica;
    }

    public void log(String mensagem) {
        System.out.println("[LOG] " + mensagem);
    }
}
