package br.com.leonardovieira.padroes.criacionais.builder;
 
/*


Padrão de Projeto Builder
O padrão Builder é utilizado para construir um objeto complexo passo a passo. 
Ele permite a criação de diferentes tipos e representações de um objeto usando 
o mesmo código de construção. É especialmente útil quando um objeto precisa ser 
criado por meio de uma série de passos, e nem todos os passos são necessários o 
tempo todo.

Exemplo em Texto
Vamos imaginar que estamos construindo uma casa. Uma casa pode ter vários 
componentes, como paredes, telhado, portas e janelas. Às vezes, queremos 
construir uma casa simples com apenas paredes e um telhado, mas outras vezes 
queremos uma casa mais complexa com portas e janelas adicionais. Usando o padrão 
Builder, podemos criar diferentes tipos de casas sem precisar criar várias 
classes diferentes para cada tipo de casa.

Explicação
Casa.java: Define a classe Casa com seus atributos, getters e um 
construtor que aceita um objeto Builder.
Builder.java: Define a classe Builder com métodos para definir os atributos 
de Casa e um método build que retorna uma nova instância de Casa.
Main.java: Testa a construção de diferentes tipos de casas usando a classe Builder.
Este exemplo ilustra como o padrão Builder pode ser implementado com uma 
classe Builder separada, permitindo a construção fluida de objetos complexos em Java.

*/
public class Principal {

    public static void main(String[] args) {
        // Construindo uma casa simples
        Casa casaSimples = new Builder()
                .comParedes("Paredes de tijolos")
                .comTelhado("Telhado de telhas")
                .build();

        System.out.println("Casa Simples:");
        System.out.println("Paredes: " + casaSimples.getParedes());
        System.out.println("Telhado: " + casaSimples.getTelhado());

        // Construindo uma casa completa
        Casa casaCompleta = new Builder()
                .comParedes("Paredes de concreto")
                .comTelhado("Telhado de telhas")
                .comPortas("Portas de madeira")
                .comJanelas("Janelas de vidro")
                .build();

        System.out.println("\nCasa Completa:");
        System.out.println("Paredes: " + casaCompleta.getParedes());
        System.out.println("Telhado: " + casaCompleta.getTelhado());
        System.out.println("Portas: " + casaCompleta.getPortas());
        System.out.println("Janelas: " + casaCompleta.getJanelas());
    }

}
