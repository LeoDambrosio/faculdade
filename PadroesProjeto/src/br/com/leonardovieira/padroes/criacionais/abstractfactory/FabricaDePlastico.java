package br.com.leonardovieira.padroes.criacionais.abstractfactory;
 
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
