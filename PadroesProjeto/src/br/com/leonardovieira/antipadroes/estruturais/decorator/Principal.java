package br.com.guilhermevillaca.antipadroes.estruturais.decorator;

// 🚀 Tentando testar as combinações erradas
public class Principal {
    public static void main(String[] args) {
        Cafe cafeSimples = new Cafe();
        System.out.println(cafeSimples.getDescricao() + " = R$" + cafeSimples.getPreco());

        Cafe cafeComLeite = new CafeComLeite();
        System.out.println(cafeComLeite.getDescricao() + " = R$" + cafeComLeite.getPreco());

        Cafe cafeComAcucar = new CafeComAcucar();
        System.out.println(cafeComAcucar.getDescricao() + " = R$" + cafeComAcucar.getPreco());

        Capuccino capuccino = new Capuccino();
        System.out.println(capuccino.getDescricao() + " = R$" + capuccino.getPreco());

        CapuccinoComCanela capuccinoCanela = new CapuccinoComCanela();
        System.out.println(capuccinoCanela.getDescricao() + " = R$" + capuccinoCanela.getPreco());

        // Capuccino com canela e marshmallow
        CapuccinoComCanelaEMarshmallow capuccinoCanelaMarshmallow = new CapuccinoComCanelaEMarshmallow();
        System.out.println(capuccinoCanelaMarshmallow.getDescricao() + " = R$" + capuccinoCanelaMarshmallow.getPreco());

        // 🛑 Problema: E se quisermos um Capuccino com canela E marshmallow? Precisamos
        // criar outra classe!
    }
}
