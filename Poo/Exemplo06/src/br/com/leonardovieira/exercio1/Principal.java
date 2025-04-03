package br.com.leonardovieira.exercio1;

public class Principal {
    public static void main(String[] args) {
        Pessoa p1 = new Pessoa();
        Pessoa p2 = new Pessoa();
        Pessoa p3 = new Pessoa();

        //Nome e Idade

        p1.nome ="Joao";
        p1.idade = 25;

        System.out.println("Nome: " + p1.nome);
        System.out.println("Idade: " + p1.idade);
        p1.falar();

        p2.nome ="Maria";
        p2.idade = 19;

        System.out.println("Nome: " + p2.nome);
        System.out.println("Idade: " + p2.idade);
        p2.falar();

        p3.nome ="Francisco";
        p3.idade = 30;

        System.out.println("Nome: " + p3.nome);
        System.out.println("Idade: " + p3.idade);
        p3.falar();
        
    }

}
