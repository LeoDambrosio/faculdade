package br.com.guilhermevillaca.padroes.criacionais.singleton;

/**
 *
 * @author villaca
 */
public class Principal {

    public static void main(String[] args) {
        // Obtém a única instância da classe Singleton
        Singleton singleton1 = Singleton.getInstancia();
        Singleton singleton2 = Singleton.getInstancia();
        //Singleton s = new Singleton();

        // Exibe uma mensagem usando a instância Singleton
        singleton1.mostrarMensagem();

        // Verifica se as duas instâncias são iguais
        if (singleton1 == singleton2) {
            System.out.println("As instâncias são iguais.");
        } else {
            System.out.println("As instâncias são diferentes.");
        }
    }
}
