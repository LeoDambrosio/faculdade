package Lista01.src.br.com.leonardovieira.exercio9;

import java.util.Scanner;

public class Exercicio9 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.print("Digite um número inteiro não negativo: ");
        int numero = scanner.nextInt();
        
        if (numero < 0) {
            System.out.println("Número inválido! O fatorial só está definido para números não negativos.");
        } else {
            long fatorial = 1;
            
            for (int i = 1; i <= numero; i++) {
                fatorial *= i;
            }
            
            System.out.println(numero + "! = " + fatorial);
        }
        
        scanner.close();
    }
}
