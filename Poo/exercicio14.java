import java.util.Random;

public class exercicio14 {
    public static void main(String[] args) {
        Random random = new Random();
        
        int numero1 = random.nextInt(101);         
        int numero2 = 51 + random.nextInt(50);      
        
        int maior = Math.max(numero1, numero2);
        
        double cubo = Math.pow(maior, 3);
        
        System.out.println("Números gerados:");
        System.out.println("Número 1 (0-100): " + numero1);
        System.out.println("Número 2 (51-100): " + numero2);
        System.out.println("\nO maior número é: " + maior);
        System.out.println("Este número elevado ao cubo é: " + cubo);
    }
}
