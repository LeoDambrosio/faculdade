/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package excecao;

import java.util.Scanner;

public class ExemploThrows {
    
    public static void validarIdade(int idade) throws IllegalArgumentException{
        if (idade<18){
            throw new IllegalArgumentException("Idade Invalidade");         
        }            
    }
    public static void main(String[] args) {
        Scanner leia = new Scanner(System.in);
        System.out.println("Informe sua idade");
        int id = leia.nextInt();
        try {
            validarIdade(id);
        } catch (IllegalArgumentException erro){
            System.out.println("Erro capturado:"+erro.getMessage());
        }
                
        
    }
    
}
