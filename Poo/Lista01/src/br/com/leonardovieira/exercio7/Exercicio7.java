package lista2.src.br.com.leonardovieira.exercio7;

import java.util.Scanner;

public class Exercicio7 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.print("Digite um número inteiro não negativo: ");
        int numero = scanner.nextInt();
        
        if (numero < 0) {
            System.out.println("Número inválido! O fatorial só está definido para números não negativos.");
        } else {
            long fatorial = 1;
            int contador = 1;
            
            while (contador <= numero) {
                fatorial *= contador;
                contador++;
            }
            
            System.out.println("O fatorial de " + numero + " é: " + fatorial);
        }
        
        scanner.close();
    }
}
