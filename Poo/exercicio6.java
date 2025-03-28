import java.util.Scanner;

public class exercicio6 {
        public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.println("Digite um dia da semana (ex: Segunda, Terça, Quarta, etc.):");
        String dia = scanner.nextLine().trim(); 
        
        if (dia.equalsIgnoreCase("segunda") || 
            dia.equalsIgnoreCase("terça") || 
            dia.equalsIgnoreCase("quarta") || 
            dia.equalsIgnoreCase("quinta") || 
            dia.equalsIgnoreCase("sexta")) {
            System.out.println("Bom dia!");
        } 
        else if (dia.equalsIgnoreCase("sábado") || 
                 dia.equalsIgnoreCase("domingo")) {
            System.out.println("Mal dia!");
        } 
        else {
            System.out.println("Dia inválido! Digite um dia da semana válido.");
        }
        
        scanner.close();
    }
}

