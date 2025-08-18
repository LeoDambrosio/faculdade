package br.com.guilhermevillaca.padroes.criacionais.abstractfactory;

/**
 *
 * @author villaca
 */
public class FabricaDePlastico implements FabricaDeBrinquedos {

    @Override
    public Ursinho criarUrsinho() {
        return new UrsinhoDePlastico();
    }

    @Override
    public Coelho criarCoelho() {
        return new CoelhoDePlastico();
    }

}
