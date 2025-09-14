package br.com.guilhermevillaca.padroes.estruturais.bridge;

/**
 *
 * @author villaca
 */
public class ControleRemotoAvancado extends ControleRemoto {

    public ControleRemotoAvancado(Dispositivo dispositivo) {
        super(dispositivo);
    }

    public void silenciar() {
        System.out.println("Dispositivo silenciado");
    }
}
