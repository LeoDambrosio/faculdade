package br.com.guilhermevillaca.padroes.estruturais.flyweight;

/*
 * Vantagens do Flyweight
✅ Redução do consumo de memória ao reutilizar objetos idênticos.
✅ Melhora o desempenho ao evitar a criação excessiva de instâncias.
✅ Facilidade de manutenção, pois a lógica de reutilização é centralizada na fábrica.
 */
public class EditorTexto {

    public static void main(String[] args) {
        CaractereFlyweight c1 = CaractereFactory.getCaractere('A', "Arial", 12);
        CaractereFlyweight c2 = CaractereFactory.getCaractere('A', "Arial", 12);
        CaractereFlyweight c3 = CaractereFactory.getCaractere('B', "Arial", 12);
        CaractereFlyweight c4 = CaractereFactory.getCaractere('C', "Arial", 12);

        c1.exibir();
        c2.exibir();
        c3.exibir();
        c4.exibir();

        // Verificando que 'A' está sendo reutilizado
        System.out.println("c1 e c2 são o mesmo objeto? " + (c1 == c2)); // true
    }

}
