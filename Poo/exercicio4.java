import java.util.Scanner;

public class exercicio4 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.println("Digite três números:");
        System.out.print("Número 1: ");
        double num1 = scanner.nextDouble();
        
        System.out.print("Número 2: ");
        double num2 = scanner.nextDouble();
        
        System.out.print("Número 3: ");
        double num3 = scanner.nextDouble();
        
        double media = (num1 + num2 + num3) / 3;
        
        System.out.printf("A média é: %.2f%n", media);
        
        if (media > 7) {
            System.out.println("Média MAIOR que 7");
        } else if (media < 7) {
            System.out.println("Média MENOR que 7");
        } else {
            System.out.println("Média IGUAL a 7");
        }
        
        scanner.close();
    }
}

