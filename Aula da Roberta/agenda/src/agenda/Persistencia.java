package agenda;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class Persistencia {
    private String arquivo;

    public Persistencia(String nomeArquivo) {
        this.arquivo = nomeArquivo;
        criarArquivo();
    }

    public void criarArquivo() {
        try {
            File file = new File(arquivo);
            if (file.createNewFile()) {
                System.out.println("Arquivo '" + arquivo + "' criado com sucesso.");
            } else {
                System.out.println("Usando arquivo existente: " + arquivo);
            }
        } catch (IOException ex) {
            System.out.println("Erro ao criar ou acessar o arquivo");
        }
    }

    public void inserir(Contato contato) {
        try (BufferedWriter buffer = new BufferedWriter(new FileWriter(arquivo, true))) {
            buffer.write(contato.getNome() + ";" + contato.getTelefone() + ";" + contato.getEmail());
            buffer.newLine();
        } catch (IOException ex) {
            System.out.println("Erro ao gravar contato");
        }
    }

    public void listarContatos() {
        try (BufferedReader buffer = new BufferedReader(new FileReader(arquivo))) {
            String linha = buffer.readLine();
            System.out.println("-------Lista de Contatos-------");
            while (linha != null) {
                String[] valores = linha.split(";");
                System.out.println("Nome: " + valores[0] + " | Telefone: " + valores[1] + " | Email: " + valores[2]);
                linha = buffer.readLine();
            }
        } catch (IOException e) {
            System.out.println("Erro ao ler contatos");
        }
    }

    public void editar(String nome, Contato novo) {
        StringBuilder temp = new StringBuilder();
        try (BufferedReader buffer = new BufferedReader(new FileReader(arquivo))) {
            String linha = buffer.readLine();
            while (linha != null) {
                String[] valores = linha.split(";");
                if (nome.equalsIgnoreCase(valores[0])) {
                    linha = novo.getNome() + ";" + novo.getTelefone() + ";" + novo.getEmail();
                }
                temp.append(linha).append("\n");
                linha = buffer.readLine();
            }
        } catch (IOException e) {
            System.out.println("Erro ao editar contatos");
        }

        try (BufferedWriter buffer = new BufferedWriter(new FileWriter(arquivo))) {
            buffer.write(temp.toString());
        } catch (IOException e) {
            System.out.println("Erro ao atualizar arquivo");
        }
    }

    public void excluir(String nome) {
        StringBuilder temp = new StringBuilder();
        try (BufferedReader buffer = new BufferedReader(new FileReader(arquivo))) {
            String linha = buffer.readLine();
            while (linha != null) {
                String[] valores = linha.split(";");
                if (!nome.equalsIgnoreCase(valores[0])) {
                    temp.append(linha).append("\n");
                }
                linha = buffer.readLine();
            }
        } catch (IOException e) {
            System.out.println("Erro ao excluir contato");
        }

        try (BufferedWriter buffer = new BufferedWriter(new FileWriter(arquivo))) {
            buffer.write(temp.toString());
        } catch (IOException e) {
            System.out.println("Erro ao atualizar arquivo");
        }
    }

    public static void listarArquivosAgenda() {
        File pasta = new File(".");
        File[] arquivos = pasta.listFiles((dir, name) -> name.endsWith(".txt"));

        System.out.println("Arquivos de agenda disponíveis:");
        if (arquivos != null && arquivos.length > 0) {
            for (File arquivo : arquivos) {
                System.out.println("- " + arquivo.getName());
            }
        } else {
            System.out.println("Nenhum arquivo de agenda encontrado.");
        }
    }
}
