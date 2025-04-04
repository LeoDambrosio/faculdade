package lista2.src.br.com.leonardovieira.exercio16;

import java.util.Scanner;

public class Exercicio16 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.print("Digite uma frase: ");
        String frase = scanner.nextLine();
        
        String resultado = substituirVogais(frase);
        
        System.out.println("Frase modificada:");
        System.out.println(resultado);
        
        scanner.close();
    }
    
    public static String substituirVogais(String texto) {
        return texto.toUpperCase()
                   .replace('A', '4')
                   .replace('E', '3')
                   .replace('I', '1')
                   .replace('O', '0');
    }
}
