package Lista01.src.br.com.leonardovieira.exercio13;

import java.util.Scanner;

public class Exercicio22 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.print("Digite o primeiro número (base): ");
        double base = scanner.nextDouble();
        
        System.out.print("Digite o segundo número (expoente): ");
        double expoente = scanner.nextDouble();
        
        double potencia = 1;
        for (int i = 0; i < expoente; i++) {
            potencia *= base;
        }
        
        double raiz = potencia;
        double precisao = 0.00001;
        while (raiz * raiz - potencia > precisao) {
            raiz = (raiz + potencia / raiz) / 2;
        }
        
        long resultado = (long) raiz;
        if (raiz - resultado > 0) {
            resultado++;
        }
        
        System.out.println("\nResultados:");
        System.out.println(base + " elevado a " + expoente + " = " + potencia);
        System.out.println("Raiz quadrada do resultado = " + raiz);
        System.out.println("Valor arredondado para cima = " + resultado);
        
        scanner.close();
    }
}
