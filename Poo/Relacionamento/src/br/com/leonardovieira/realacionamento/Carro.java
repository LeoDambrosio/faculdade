package br.com.leonardovieira.realacionamento;

public class Carro {

    private String modelo;
    private Pessoa pessoa;

    public Carro(String modelo, Pessoa pessoa){
        this.modelo = modelo;
        this.pessoa = pessoa;
    }

    public String getModelo(){
        return modelo;
    }

    public static void main(String[] args) {
        Pessoa pessoa = new Pessoa("Guilherme");
        Carro carro = new Carro("Fusca", pessoa);

        System.out.println(pessoa.getNome() + " tem um carro " + carro.getModelo());
    }

}