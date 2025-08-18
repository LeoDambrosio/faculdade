package br.com.guilhermevillaca.padroes.comportamentais.templatemethod;

/**
 *
 * @author villaca
 */
// Subclasse concreta para preparar chá
public class Cha extends Bebida {

    @Override
    protected void adicionarIngredientePrincipal() {
        System.out.println("Adicionando saquinho de chá na água quente...");
    }

    @Override
    protected void adicionarCondimentos() {
        System.out.println("Adicionando limão...");
    }
}
