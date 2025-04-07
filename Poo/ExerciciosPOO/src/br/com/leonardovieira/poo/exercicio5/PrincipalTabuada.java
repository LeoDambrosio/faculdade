package br.com.leonardovieira.poo.exercicio5;

import java.util.Scanner;

public class PrincipalTabuada {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Digite um numero natural nao positivo: ");
        int numero = scanner.nextInt();

        if (numero < 1) {
            System.out.println("Por favor, digite um numero natural valido.");
        } else {
            Tabuada tabuada = new Tabuada();
            tabuada.setNumero(numero);
            tabuada.calcularTabuada();
        }

        scanner.close();
    }
}

