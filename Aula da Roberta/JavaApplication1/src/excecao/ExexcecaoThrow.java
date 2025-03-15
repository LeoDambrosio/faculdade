/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package excecao;

import java.util.Scanner;

public class ExexcecaoThrow {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        Scanner leia = new Scanner(System.in);
        System.out.println("Informe sua idade");
        int idade = leia.nextInt();
        
        if (idade < 18){
            throw new IllegalArgumentException("Idade minima e 18 anos");
            //System.out.println("Idade menor que 18");
        }
        System.out.println("idade permitida");
        
    
}
}
