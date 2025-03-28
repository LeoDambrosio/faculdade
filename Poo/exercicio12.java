import java.util.Scanner;

public class exercicio12 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String[] nomes = new String[10];
        StringBuilder concatenado = new StringBuilder();

        System.out.println("Digite os nomes de 10 pessoas:");

        for (int i = 0; i < 10; i++) {
            System.out.print("Nome " + (i + 1) + ": ");
            nomes[i] = scanner.nextLine();
        }

        for (String nome : nomes) {
            concatenado.append(nome).append(" ");
        }

        System.out.println("\nNomes concatenados:");
        System.out.println(concatenado.toString().trim());

        scanner.close();
    }
}