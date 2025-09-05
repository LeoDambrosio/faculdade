package br.com.leonardovieira.padroes.comportamentais.templatemethod;

public class Cafe extends Bebida {

    @Override
    protected void adicionarIngredientePrincipal() {
        System.out.println("Adicionando po de cafe na agua quente...");
    }

    @Override
    protected void adicionarCondimentos() {
        System.out.println("Adicionando acucar e leite...");
    }
}
