package br.com.leonardovieira.padroes.comportamentais.state;

public class Principal {

    public static void main(String[] args) {

        MaquinaVenda maquinaVenda = new MaquinaVenda(2);

        System.out.println("-----------------");
        System.out.println("Primeira tentativa Inserindo moeda");
        maquinaVenda.acionarAlavanca();

        System.out.println("-----------------------");
        System.out.println("Segunda tentativa Inserindo moeda");
        maquinaVenda.inserirMoeda();
        maquinaVenda.acionarAlavanca();

        System.out.println("-----------------------");
        System.out.println("Terceira tentativa Ejetando moeda");
        maquinaVenda.inserirMoeda();
        maquinaVenda.ejetarMoeda();

        System.out.println("-----------------------");
        System.out.println("Quarta tentativa Inserindo moeda");
        maquinaVenda.inserirMoeda();
        maquinaVenda.acionarAlavanca();

        System.out.println("-----------------------");
        System.out.println("Quinta tentativa Inserindo moeda, Mas sem estoque");
        maquinaVenda.inserirMoeda();
    }
}
