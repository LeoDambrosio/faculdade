package br.com.guilhermevillaca.padroes.criacionais.abstractfactory;

/**
 *
 * @author villaca
 */
public class FabricaDePelucia implements FabricaDeBrinquedos {

    @Override
    public Ursinho criarUrsinho() {
        return new UrsinhoDePelucia();
    }

    @Override
    public Coelho criarCoelho() {
        return new CoelhoDePelucia();
    }

}
