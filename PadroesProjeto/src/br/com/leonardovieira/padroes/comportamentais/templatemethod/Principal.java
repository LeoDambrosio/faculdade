package br.com.leonardovieira.padroes.comportamentais.templatemethod;

/**
 *
 *
 * O padrão Template Method define o esqueleto de um algoritmo em uma operação,
 * postergando a definição de alguns passos para subclasses. O padrão permite
 * que subclasses redefinam certos passos de um algoritmo sem alterar sua
 * estrutura.
 *
 * Vamos implementar um exemplo em Java onde diferentes tipos de preparos de
 * bebidas (como chá e café) seguem um processo similar, mas com algumas
 * variações nos passos específicos.
 *
 * Explicação: A classe abstrata Bebida define o esqueleto do algoritmo no
 * método preparar(), que é um Template Method. Esse método controla a sequência
 * de passos na preparação da bebida. Os métodos adicionarIngredientePrincipal()
 * e adicionarCondimentos() são passos específicos que as subclasses Cha e Cafe
 * implementam de maneira diferente. O método adicionarCondimentos() é um método
 * "gancho" que pode ou não ser redefinido pelas subclasses. Ele fornece
 * flexibilidade para incluir ou omitir condimentos ao preparar diferentes tipos
 * de bebidas. Este exemplo ilustra como o padrão Template Method permite que o
 * esqueleto de um algoritmo seja definido na classe base, enquanto permite que
 * os detalhes específicos sejam fornecidos pelas subclasses, promovendo
 * reutilização de código e flexibilidade.
 */
public class Principal {

    public static void main(String[] args) {
        Bebida cha = new Cha();
        System.out.println("Preparando Chá:");
        cha.preparar();

        System.out.println("\nPreparando Café:");
        Bebida cafe = new Cafe();
        cafe.preparar();
    }
}
