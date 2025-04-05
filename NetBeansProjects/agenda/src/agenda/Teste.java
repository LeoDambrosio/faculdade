package agenda;

import java.util.Scanner;

public class Teste {

    public static void main(String[] args) {
        
        int opcao;
        Scanner leia = new Scanner(System.in);
        do{
            System.out.println("---MENU AGENDA DE CONTATOS---");
            System.out.println("1. Adicionar Contatos");
            System.out.println("2. Listar onatatos");
            System.out.println("3. Sair");
            opcao = leia.nextInt();
            
            switch (opcao){
                case 1:
                    break;
                case 2:
                    break;
                case 0:
                    System.out.println("Saindo do programa ...");
                    break;
                default:
                    throw new AssertionError();
            }
        }while(opcao!=0);
        leia.close();
}