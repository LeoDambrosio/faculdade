package Lista01.src.br.com.leonardovieira.exercio10;

import java.util.Scanner;

public class Exercicio10 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        double soma = 0;
        double maior = Double.NEGATIVE_INFINITY; 
        
        System.out.println("Digite 10 números:");

        for (int i = 1; i <= 10; i++) {
            System.out.print("Número " + i + ": ");
            double numero = scanner.nextDouble();
            
            soma += numero;
            
            if (numero > maior) {
                maior = numero;
            }
        }
        
        double media = soma / 10;
        
        System.out.printf("\nMédia dos números: %.2f", media);
        System.out.println("\nMaior número: " + maior);
        
        scanner.close();
    }
}
