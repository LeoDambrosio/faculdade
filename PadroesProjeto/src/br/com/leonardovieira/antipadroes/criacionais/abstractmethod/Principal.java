package br.com.leonardovieira.antipadroes.criacionais.abstractmethod;

public class Principal {
    public static void main(String[] args) {
        FabricaBrinquedos fabrica = new FabricaBrinquedos();

        Object brinquedo1 = fabrica.criarBrinquedo("Coelho", "Pelucia");
        Object brinquedo2 = fabrica.criarBrinquedo("Ursinho", "Plastico");

        if (brinquedo1 instanceof CoelhoPelucia) ((CoelhoPelucia) brinquedo1).exibir();
        if (brinquedo2 instanceof UrsinhoPlastico) ((UrsinhoPlastico) brinquedo2).exibir();
    }
}