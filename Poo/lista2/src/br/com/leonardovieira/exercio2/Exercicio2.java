package lista2.src.br.com.leonardovieira.exercio2;

import java.util.Scanner;

public class Exercicio2 {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        int num1, num2, soma, produto, diferenca, media, razao, resto;

        System.out.println("Escreva o primeiro número:");
        num1 = scanner.nextInt();

        System.out.println("Escreva o segunto número:");
        num2 = scanner.nextInt();

        soma=num1+num2;

        produto=num1*num2;

        diferenca=num1-num2;

        media=(num1+num2)/2;

        razao=num1/num2;

        resto=num1%num2;

        System.out.println("A Soma dos dois numeros é:" +soma);
        System.out.println("O Produto é:" +produto);
        System.out.println("A Diferença é:"+ diferenca);
        System.out.println("A Média é:" +media);
        System.out.println("A Razão é:" +razao);
        System.out.println("O Resto é:"+resto);

    }
}
