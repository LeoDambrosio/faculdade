package br.com.leonardovieira.padroes.criacionais.abstractfactory;

 
/*

Padrão de Projeto Abstract Factory
O padrão Abstract Factory é usado para criar famílias de objetos relacionados 
ou dependentes sem especificar suas classes concretas. Imagine que você tem duas 
fábricas de brinquedos, uma que fabrica brinquedos de pelúcia e outra que fabrica 
brinquedos de plástico. Dependendo da fábrica que você escolher, você terá um 
conjunto diferente de brinquedos.

Exemplo em Texto
Vamos imaginar que temos duas fábricas de brinquedos:

Fábrica de Brinquedos de Pelúcia: Cria ursinhos e coelhos de pelúcia.
Fábrica de Brinquedos de Plástico: Cria carrinhos e bonecos de plástico.
Usando o padrão Abstract Factory, podemos criar um código que permite escolher 
a fábrica de brinquedos que queremos usar, sem precisar saber os detalhes de 
como cada brinquedo é feito.

 */
public class Principal {

    public static void main(String[] args) {
        FabricaDeBrinquedos fabricaPelucia = new FabricaDePelucia();
        Coelho coelhoPelucia = fabricaPelucia.criarCoelho();
        Ursinho ursoPelucia = fabricaPelucia.criarUrsinho();
        coelhoPelucia.exibir();
        ursoPelucia.exibir();

        FabricaDeBrinquedos fabricaPlastico = new FabricaDePlastico();
        Coelho coelhoPlastico = fabricaPlastico.criarCoelho();
        Ursinho ursoPlastico = fabricaPlastico.criarUrsinho();
        coelhoPlastico.exibir();
        ursoPlastico.exibir();
    }

}
