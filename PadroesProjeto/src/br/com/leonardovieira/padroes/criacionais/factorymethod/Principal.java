package br.com.guilhermevillaca.padroes.criacionais.factorymethod;

/**
 *
 * @author villaca
 */

/*

Padrão de Projeto Factory Method
O padrão Factory Method é um padrão de criação que define um método para 
criar objetos, mas permite que as subclasses alterem o tipo de objetos que 
serão criados. Ele promove a criação de objetos sem especificar a classe exata 
do objeto que será criado.

Exemplo em Texto
Imagine que você tem uma empresa de logística que precisa transportar mercadorias 
por diferentes meios: ferroviário, marítimo e terrestre. Cada tipo de transporte 
tem suas próprias características e custos. Usando o padrão Factory Method, você 
pode criar uma classe base para a logística e deixar que subclasses específicas 
definam como criar o tipo de transporte apropriado.

Explicação
Interface de Transporte: Transporte define o contrato para todos os tipos de transporte.
Implementações de Transporte: TransporteFerroviario, TransporteMaritimo e TransporteTerrestre são as implementações concretas dos tipos de transporte.
Classe Abstrata Logistica: Logistica define o método fábrica (criarTransporte) que deve ser implementado pelas subclasses. Também define um método organizarEntrega que usa o transporte criado.
Subclasses de Logistica: LogisticaFerroviaria, LogisticaMaritima e LogisticaTerrestre implementam o método fábrica para criar o tipo específico de transporte.
Classe Principal: A Main mostra como usar as diferentes implementações de logística para organizar as entregas.

*/

public class Principal {

    public static void main(String[] args) {

        Logistica logisticaFerroviaria = new LogisticaFerroviaria();
        logisticaFerroviaria.organizarEntrega();

        Logistica logisticaMaritima = new LogisticaMaritima();
        logisticaMaritima.organizarEntrega();

        Logistica logisticaTerrestre = new LogisticaTerrestre();
        logisticaTerrestre.organizarEntrega();

    }
}
