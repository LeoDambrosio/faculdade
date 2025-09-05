package br.com.leonardovieira.padroes.comportamentais.templatemethod;

/*classe abstrata que define o template do metodo */
public abstract class Bebida {

    /*metodo template */
    public final void preparar() {
        ferverAgua();
        adicionarIngredientePrincipal();
        adicionarCondimentos();
        servir();
    }

    protected void ferverAgua() {
        System.out.println("Fervendo agua...");
    }

    /*passo a ser impplementado pela subclasse  */
    protected abstract void adicionarIngredientePrincipal();

    /*pode ter implementado ou ser redefinido na subclasse  */
    protected void adicionarCondimentos() {
        //todo
        //metodo gancho
    }

    private void servir() {
        System.out.println("Servindo a bebida...");
    }
}
