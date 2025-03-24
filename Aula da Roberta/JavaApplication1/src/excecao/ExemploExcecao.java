/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package excecao;

/**
 *
 * @author leonardo.3142
 */
public class ExemploExcecao {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        try {
            int x = 0;
            int y = 100 / x;
            System.out.println("Resultado: " + y);
        } catch (ArithmeticException e) {
            System.out.println("Erro "+ e.getMessage());
        }
    }
}
