import java.util.Scanner;

public class exercicio15 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.print("Digite um número para calcular a raiz cúbica: ");
        double numero = scanner.nextDouble();
        
        double raiz = numero; 
        double precisao = 0.00001; 
        double diferenca;
        
        do {
            double raizAnterior = raiz;
            raiz = (2 * raiz + numero / (raiz * raiz)) / 3;
            diferenca = Math.abs(raiz - raizAnterior);
        } while (diferenca > precisao);
        
        System.out.printf("A raiz cúbica de %.2f é aproximadamente %.5f%n", numero, raiz);
        
        scanner.close();
    }
}