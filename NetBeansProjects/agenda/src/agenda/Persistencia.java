package agenda;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Persistencia {

    private final String arquivo = "contatos.txt";

    public void criarArquivo() {

        try {
            File file = new File(arquivo);
            if (file.createNewFile()) {
                System.out.println("Aquivo criado com sucesso");
            }
        } catch (IOException ex) {
            System.out.println("Erro ao criar arquivo");
        }

    }

    public void inserir(Contato contato) {
        try {
            FileWriter escritor = escritor = new FileWriter(arquivo, true);
            BufferedWriter buffer = new BufferedWriter(escritor);
            buffer.write(contato.getNome() + ";" + contato.getTelefone() + ";" + contato.getEmail());
            
            buffer.close();

        } catch (IOException ex) {
            System.out.println("Erro ao gravar arquivo");

        }
    }

}
