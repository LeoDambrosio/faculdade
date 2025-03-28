import java.util.Scanner;

public class FormatarVogaisConsoantes {
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
                // É vogal - converte para maiúsculo
                sb.append(Character.toUpperCase(c));
            } else {
                // É consoante - converte para minúsculo
                sb.append(Character.toLowerCase(c));
            }
        }
        
        return sb.toString();
    }
}