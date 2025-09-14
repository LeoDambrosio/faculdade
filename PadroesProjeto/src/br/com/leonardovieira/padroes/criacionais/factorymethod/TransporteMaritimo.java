package br.com.guilhermevillaca.padroes.criacionais.factorymethod;

/**
 *
 * @author villaca
 */
public class TransporteMaritimo implements Transporte{

    @Override
    public void entregar() {
        System.out.println("Entregando por transporte marítimo.");
    }

}
