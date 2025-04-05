/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package agenda;

import java.io.FileReader;


public class ListarContato {

 public static void main(String[] args) {
        listarContatos();
    }

    public static void listarContatos() {
        
        try {
            FileReader leitor = new FileReader(arquivo);
            BufferedReader buffer = new BufferedReader(leitor){
            String linha = buffer.readLine();
            System.out.println("-------Lista de Contatos-------");
            while (linha != null) {
                String valores[] = linha.split(";");
                contato contato = new contato();
                contato.setNome(valores[0]);
                contato.setTefone(valores[1]);
                contato.setEmail(valores[2]);
                System.out.println(contato.getNome());
                linha = buffer.readLine();
            }
            
        } catch (IOException e) {
            System.out.println("Erro ao ler contatos");
        }
    }
}
