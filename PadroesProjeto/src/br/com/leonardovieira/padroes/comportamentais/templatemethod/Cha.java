package br.com.leonardovieira.padroes.comportamentais.templatemethod;

public class Cha extends Bebida {

    @Override
    protected void adicionarIngredientePrincipal() {
        System.out.println("Adicionando saquinho de cha na agua quente...");
    }

    @Override
    protected void adicionarCondimentos() {
        System.out.println("Adicionando limao...");
    }
}
