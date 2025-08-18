package br.com.guilhermevillaca.antipadroes.criacionais.factorymethod;

// Gerenciador de Logística que lida apenas com caminhões
class Logistica {
    private Caminhao caminhao;
    private Trem trem;

    public Logistica() {
        this.caminhao = new Caminhao(); // Fortemente acoplado ao Caminhão
        this.trem = new Trem(); // Agora também fortemente acoplado ao Trem
    }

    public void planejarEntrega(String tipo) {
        System.out.println("Planejando entrega...");

        if (tipo.equalsIgnoreCase("caminhao")) {
            caminhao.entregar();
        } else if (tipo.equalsIgnoreCase("trem")) {
            trem.entregar();
        } else {
            System.out.println("Tipo de transporte desconhecido.");
        }
    }
}
