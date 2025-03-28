import java.util.Scanner;

public class exercicio5 {
      public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.println("Digite um número de 0 a 6 (domingo=0, segunda=1, ..., sábado=6):");
        int dia = scanner.nextInt();
        
        String nomeDia;
        
        switch (dia) {
            case 0:
                nomeDia = "Domingo";
                break;
            case 1:
                nomeDia = "Segunda-feira";
                break;
            case 2:
                nomeDia = "Terça-feira";
                break;
            case 3:
                nomeDia = "Quarta-feira";
                break;
            case 4:
                nomeDia = "Quinta-feira";
                break;
            case 5:
                nomeDia = "Sexta-feira";
                break;
            case 6:
                nomeDia = "Sábado";
                break;
            default:
                nomeDia = "Dia inválido";
        }
        
        if (dia >= 0 && dia <= 6) {
            System.out.println("Bom " + nomeDia + "!");
        } else {
            System.out.println(nomeDia + ". Por favor, digite um número entre 0 e 6.");
        }
        
        scanner.close();
    }
}

