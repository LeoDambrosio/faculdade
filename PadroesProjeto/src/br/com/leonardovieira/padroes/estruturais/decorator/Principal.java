package br.com.leonardovieira.padroes.estruturais.decorator;

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
