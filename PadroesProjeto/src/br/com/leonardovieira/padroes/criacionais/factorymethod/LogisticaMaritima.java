package br.com.guilhermevillaca.padroes.criacionais.factorymethod;

/**
 *
 * @author villaca
 */
public class LogisticaMaritima extends Logistica{

    @Override
    public Transporte criarTransporte() {
        return new TransporteMaritimo();
    }

}
