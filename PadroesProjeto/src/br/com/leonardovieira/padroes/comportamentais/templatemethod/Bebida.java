package br.com.leonardovieira.padroes.comportamentais.templatemethod;


// Classe abstrata Bebida que define o esqueleto para preparar uma bebida
public abstract class Bebida {

    // Método Template final para definir o esqueleto do algoritmo
    public final void preparar() {
        ferverAgua();
        adicionarIngredientePrincipal();
        adicionarCondimentos();
        servir();
    }

    // Passo comum a todas as bebidas
    private void ferverAgua() {
        System.out.println("Fervendo água...");
    }

    // Passo que deve ser implementado pelas subclasses
    protected abstract void adicionarIngredientePrincipal();

    // Passo que pode ser redefinido pelas subclasses (gancho)
    protected void adicionarCondimentos() {
        // Método gancho: pode ser redefinido ou deixado vazio
    }

    // Passo comum a todas as bebidas
    private void servir() {
        System.out.println("Servindo a bebida...");
    }
}
