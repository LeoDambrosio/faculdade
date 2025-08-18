package br.com.leonardovieira.padroes.comportamentais.templatemethod;


// Subclasse concreta para preparar café
public class Cafe extends Bebida {

    @Override
    protected void adicionarIngredientePrincipal() {
        System.out.println("Adicionando pó de café na água quente...");
    }

    @Override
    protected void adicionarCondimentos() {
        System.out.println("Adicionando açúcar e leite...");
    }
}
