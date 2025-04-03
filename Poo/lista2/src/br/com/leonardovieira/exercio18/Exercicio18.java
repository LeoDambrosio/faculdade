package lista2.src.br.com.leonardovieira.exercio18;

import java.util.Scanner;

public class Exercicio18 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.print("Digite uma palavra ou frase: ");
        String texto = scanner.nextLine();
        
        String textoFormatado = formatarVogaisConsoantes(texto);
        
        System.out.println("Texto formatado:");
        System.out.println(textoFormatado);
        
        scanner.close();
    }
    
    public static String formatarVogaisConsoantes(String texto) {
        StringBuilder sb = new StringBuilder();
        String vogais = "AEIOUÁÉÍÓÚÂÊÎÔÛÃÕÀÈÌÒÙaeiouáéíóúâêîôûãõàèìòù";
        
        for (char c : texto.toCharArray()) {
            if (vogais.indexOf(c) != -1) {
                sb.append(Character.toUpperCase(c));
            } else {
                sb.append(Character.toLowerCase(c));
            }
        }
        
        return sb.toString();
    }
}
