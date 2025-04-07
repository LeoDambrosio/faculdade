package Lista4.src.br.com.leonardovieira.exercicio3;

public class PrincipalCalculadora {
    public static void main(String[] args) {
        Calculadora calc = new Calculadora();

        int resultado1 = calc.somar(5, 10);
        double resultado2 = calc.somar(3.5, 7.2);
        int resultado3 = calc.somar(1, 2, 3);

        System.out.println("Soma de dois inteiros: " + resultado1);
        System.out.println("Soma de dois doubles: " + resultado2);
        System.out.println("Soma de três inteiros: " + resultado3);
    }
}

