package br.com.guilhermevillaca.padroes.estruturais.facade;

public class Principal {
    public static void main(String[] args) {
        // Criando as instâncias do subsistema
        Amplificador amp = new Amplificador();
        Projetor projetor = new Projetor();
        Player player = new Player();

        // Usando o Facade para simplificar a interação
        HomeTheaterFacade homeTheater = new HomeTheaterFacade(amp, projetor, player);
        homeTheater.assistirFilme("O Poderoso Chefão");
    }

}
