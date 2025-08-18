package br.com.guilhermevillaca.padroes.criacionais.singleton;

/**
 *
 * @author villaca
 */
public class Singleton {

    // A única instância da classe
    private static Singleton instancia;

    // Construtor privado para evitar instâncias externas
    private Singleton() {
        // Código para inicializar a instância
    }

    // Método público para obter a instância única
    public static Singleton getInstancia() {
        if (instancia == null) {
            instancia = new Singleton();
        }
        return instancia;
    }

    // Exemplo de método da classe Singleton
    public void mostrarMensagem() {
        System.out.println("Mensagem da instância Singleton.");
    }
}
