package lista2.src.br.com.leonardovieira.exercio8;

import java.util.Scanner;

public class Exercicio8 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int numero;
        int totalNumeros = 0;

        System.out.println("Digite números inteiros (digite -1 para parar):");

        do {
            System.out.print("Número: ");
            numero = scanner.nextInt();
            
            if (numero != -1) {
                totalNumeros++;
            }
        } while (numero != -1);

        System.out.println("Total de números lidos: " + totalNumeros);
        scanner.close();
    }
}
