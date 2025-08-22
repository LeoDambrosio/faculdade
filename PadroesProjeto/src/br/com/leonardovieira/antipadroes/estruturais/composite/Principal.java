package br.com.leonardovieira.antipadroes.estruturais.composite;

public class Principal {
    public static void main(String[] args) {
        Produto leite = new Produto("Leite 1L", 5.00);
        Caixa caixaDeLeite = new Caixa("Caixa de Leite", leite, 12);
        Fardo fardoDeLeite = new Fardo("Fardo de Leite", caixaDeLeite, 6);

        double total = leite.getPreco() + caixaDeLeite.getPreco() + fardoDeLeite.getPreco();
        System.out.println("Total da compra: R$" + total);
    }
}
