/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package agenda;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author 10253
 */
public class Persistencia {

    private  final String arquivo = "contatos.txt";

    public void criarArquivo() {
        try {
            File file = new File(arquivo);
            if (file.createNewFile()) {
                System.out.println("Arquivo criado com sucesso");
            }
        } catch (IOException ex) {
            System.out.println("Erro ao criar arquivo");
        }
    }

    public void inserir(Contato contato) {
        try {
            FileWriter escritor = 
                    escritor = new FileWriter(arquivo, true);
            
            BufferedWriter buffer = new BufferedWriter(escritor);
            buffer.write(contato.getNome()+";"+
                         contato.getTelefone()+";"+
                         contato.getEmail());
            buffer.newLine();
            buffer.close();
        } catch (IOException ex) {
            System.out.println("Erro ao gravar contato");
        }
    }
    
    public void listarContatos(){
        try {
            FileReader leitor = new FileReader(arquivo);
            BufferedReader buffer = new BufferedReader(leitor);
            String linha = buffer.readLine();
            System.out.println("-------Lista de Contatos-------");
            while(linha != null){
                String valores[] = linha.split(";");
                Contato contato = new Contato();
                contato.setNome(valores[0]);
                contato.setTelefone(valores[1]);
                contato.setEmail(valores[2]);
                System.out.println(contato.getNome());
                linha = buffer.readLine();
            }
           buffer.close();
        } catch (IOException e) {
            System.out.println("Erro ao ler contatos");
        }
    }
    
    public void editar(String nome, Contato novo){
        StringBuilder temp = new StringBuilder();
        try {
            FileReader leitor = new FileReader(arquivo);
            BufferedReader buffer = new BufferedReader(leitor);
            String linha = buffer.readLine();
            while(linha != null){
                String valores[] = linha.split(";");
                if(nome.equalsIgnoreCase(valores[0])){
                   //encontrou o nome correto
                   linha = novo.getNome()+";"+novo.getTelefone()+";"+novo.getEmail();
                }
                temp.append(linha).append("\n");
                linha = buffer.readLine();
            }
           buffer.close();
        } catch (IOException e) {
            System.out.println("Erro ao ler contatos");
        }
        try {
            FileWriter escritor = new FileWriter(arquivo);
            BufferedWriter buffer = new BufferedWriter(escritor);
            buffer.write(temp.toString());
            buffer.close();
        }
        catch (Exception e){
            System.out.println("Erro ao atualizar arquivo");
        }
    }
}