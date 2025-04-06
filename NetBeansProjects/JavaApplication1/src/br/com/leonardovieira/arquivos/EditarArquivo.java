/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package br.com.leonardovieira.arquivos;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author leonardo.3142
 */
public class EditarArquivo {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        File arquivo = new File("exeplo.txt");
        boolean existe = arquivo.exists() && arquivo.length()>0;
        
        try {
            //pra abrir um arquivo que ja tem uma informacao 
            FileWriter escritor = new FileWriter("exemplo.txt",true);
            BufferedWriter buffer = new BufferedWriter(escritor);
            if (existe){
                //pregunta pro usuario o que escrever  
            }
            buffer.newLine();
            buffer.write("deu certo isso");
            
        }catch (IOException ex) {
            Logger.getLogger(EscreverArquivo.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
}
