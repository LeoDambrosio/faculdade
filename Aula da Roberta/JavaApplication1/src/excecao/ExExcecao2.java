/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package excecao;

import java.util.Scanner;
/**
 *
 * @author leonardo.3142
 */
public class ExExcecao2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Scanner leia = new Scanner(System.in);
        try{
        System.out.println("Informe um valor para x: ");
        int x = leia.nextInt();
        int y = 100/x;
        System.out.println("Resultado "+y);
        } catch (ArithmeticException e) {
            System.out.println("Operacao Invalida");
            System.out.println("Erro: "+e.getMessage());
        } catch (Exception e){
            System.out.println("Formato errado");
            //System.out.println("Erro: "+e.getMessage());
            System.out.println(new Exception("Numero Esperado"));
        }
        
    }
    
}
