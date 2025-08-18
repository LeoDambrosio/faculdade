package br.com.guilhermevillaca.antipadroes.criacionais.abstractmethod;
// Fábrica única sem Abstract Factory
class FabricaBrinquedos {
    public Object criarBrinquedo(String tipo, String material) {
        if (tipo.equalsIgnoreCase("Coelho")) {
            if (material.equalsIgnoreCase("Pelucia")) {
                return new CoelhoPelucia();
            } else if (material.equalsIgnoreCase("Plastico")) {
                return new CoelhoPlastico();
            }
        } else if (tipo.equalsIgnoreCase("Ursinho")) {
            if (material.equalsIgnoreCase("Pelucia")) {
                return new UrsinhoPelucia();
            } else if (material.equalsIgnoreCase("Plastico")) {
                return new UrsinhoPlastico();
            }
        }
        return null;
    }
}