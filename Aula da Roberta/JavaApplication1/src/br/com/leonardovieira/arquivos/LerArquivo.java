package br.com.leonardovieira.arquivos;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class LerArquivo {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try {
            // TODO code application logic here
            FileReader leitor = new FileReader("exemplo.txt");
            BufferedReader buffer = new BufferedReader(leitor);
            String linha;
            linha = buffer.readLine();
            while(linha != null){
                System.out.println(linha);
                linha = buffer.readLine();
            }
            buffer.close(); 
        } catch (IOException ex) {
            System.out.println("Erro ao ler o arquivo");        }
    }
    
}
