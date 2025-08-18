package br.com.guilhermevillaca.padroes.estruturais.decorator;

/*
 * Benefícios do Padrão Decorator
✔ Código flexível e modular → Podemos adicionar novos ingredientes sem modificar as classes existentes.
✔ Evita a explosão de subclasses → Não precisamos criar várias combinações de café.
✔ Ordem dinâmica → Podemos decorar o café em qualquer ordem.

Agora conseguimos montar qualquer tipo de café sem precisar criar subclasses para cada variação
 */
// 🚀 Testando a solução correta
public class Principal {
    public static void main(String[] args) {
        // Café simples
        Cafe cafe = new CafeSimples();
        System.out.println(cafe.getDescricao() + " = R$" + cafe.getPreco());

        // Café com leite e açúcar
        Cafe cafeComLeiteAcucar = new Acucar(new Leite(new CafeSimples()));
        System.out.println(cafeComLeiteAcucar.getDescricao() + " = R$" + cafeComLeiteAcucar.getPreco());

        // Capuccino com canela e marshmallow
        Cafe capuccinoComCanelaMarshmallow = new Marshmallow(new Canela(new Capuccino(new CafeSimples())));
        System.out.println(capuccinoComCanelaMarshmallow.getDescricao() + " = R$" + capuccinoComCanelaMarshmallow.getPreco());

        // Café com adoçante
        Cafe cafeComAdocante = new Adocante(new CafeSimples());
        System.out.println(cafeComAdocante.getDescricao() + " = R$" + cafeComAdocante.getPreco());
    }
}
