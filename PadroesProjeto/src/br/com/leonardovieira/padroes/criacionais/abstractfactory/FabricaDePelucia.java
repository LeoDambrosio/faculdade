package br.com.leonardovieira.padroes.criacionais.abstractfactory;
 
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
