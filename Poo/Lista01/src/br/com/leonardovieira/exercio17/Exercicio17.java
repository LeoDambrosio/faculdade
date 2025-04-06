package Lista01.src.br.com.leonardovieira.exercio17;

import java.util.Scanner;

public class Exercicio17 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.print("Digite uma palavra ou frase: ");
        String texto = scanner.nextLine();
        
        String textoInvertido = inverterString(texto);
        
        System.out.println("Texto invertido:");
        System.out.println(textoInvertido);
        
        scanner.close();
    }
    
    public static String inverterString(String texto) {
        char[] caracteres = texto.toCharArray();
        
        for (int i = 0, j = caracteres.length - 1; i < j; i++, j--) {
            char temp = caracteres[i];
            caracteres[i] = caracteres[j];
            caracteres[j] = temp;
        }
        
        return new String(caracteres);
    }
}
