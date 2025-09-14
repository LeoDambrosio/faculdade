package br.com.leonardovieira.padroes.comportamentais.observer;

public class Principal {

    public static void main(String[] args) {
        
        Produto produto = new Produto("Notebook", 500);

        Cliente cliente1 = new Cliente("Leo");
        Cliente cliente2 = new Cliente("Leozin");
        Cliente cliente3 = new Cliente("Andre");
        Cliente cliente4 = new Cliente("Henrique");
        Cliente cliente5 = new Cliente("Alan");

        produto.adicionarObservador(cliente1);
        produto.adicionarObservador(cliente2);
        produto.adicionarObservador(cliente3);
        produto.adicionarObservador(cliente4);
        produto.adicionarObservador(cliente5);

        produto.setQuantidade(450);

        produto.removerObservador(cliente3);
        produto.setQuantidade(357);
    }
}