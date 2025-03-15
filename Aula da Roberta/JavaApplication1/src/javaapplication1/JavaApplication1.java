
package javaapplication1;

import java.util.Scanner;
import java.util.regex.Pattern;
import java.util.regex.Matcher;


public class JavaApplication1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
         Scanner leia = new Scanner(System.in);
        String Telefone;
        
        System.out.println("Digite o Telefone no formato XX+XX XXXXX-XXXX");
        Telefone = leia.nextLine();
        
        String regex_Tel = "\\d{2}\\+\\(d{2}\\)\\d{5}-\\d{4}";
        Pattern pattern = Pattern.compile(regex_Tel);
        
        Matcher matcher = pattern.matcher(Telefone);
        
        if (matcher.matches()){
            System.out.println("Telefone Valido");
        }else{
            System.out.println("Telefone Invalido");
        }
        leia.close();
    }
    
}
