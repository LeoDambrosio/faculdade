/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package excecao;

import javax.swing.JOptionPane;

/**
 *
 * @author leonardo.3142
 */
public class ExExcecaoForNumero {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        String var = JOptionPane.showInputDialog("Digite um numero inteiro");
        try {
            int i = Integer.parseInt(var);
            JOptionPane.showMessageDialog(null, "O numero digitado foi: "+i);
        } catch (NumberFormatException nfe) {
            JOptionPane.showMessageDialog(null,"Nao e possivel atribuir um numero inteiro");
            System.out.println("Erro "+nfe.getMessage());
        }
    }
    
}
