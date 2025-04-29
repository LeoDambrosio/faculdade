package agenda;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Scanner;

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
                System.out.println("Arquivo criado: " + arquivo);
            }
        } catch (IOException ex) {
            System.out.println("Erro ao criar arquivo");
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
            String linha;
            System.out.println("-------Lista de Contatos-------");
            while ((linha = buffer.readLine()) != null) {
                String[] valores = linha.split(";");
                System.out.println("Nome: " + valores[0] + " | Tel: " + valores[1] + " | Email: " + valores[2]);
            }
        } catch (IOException e) {
            System.out.println("Erro ao ler contatos");
        }
    }

    public void editar(String nome, Contato novo) {
        StringBuilder temp = new StringBuilder();
        try (BufferedReader buffer = new BufferedReader(new FileReader(arquivo))) {
            String linha;
            while ((linha = buffer.readLine()) != null) {
                String[] valores = linha.split(";");
                if (valores[0].equalsIgnoreCase(nome)) {
                    linha = novo.getNome() + ";" + novo.getTelefone() + ";" + novo.getEmail();
                }
                temp.append(linha).append("\n");
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
            String linha;
            while ((linha = buffer.readLine()) != null) {
                String[] valores = linha.split(";");
                if (!valores[0].equalsIgnoreCase(nome)) {
                    temp.append(linha).append("\n");
                }
            }
        } catch (IOException e) {
            System.out.println("Erro ao excluir contato");
        }

        try (BufferedWriter buffer = new BufferedWriter(new FileWriter(arquivo))) {
            buffer.write(temp.toString());
        } catch (IOException e) {
            System.out.println("Erro ao salvar alterações");
        }
    }

    public boolean contatoJaExiste(String nome) {
        try (BufferedReader buffer = new BufferedReader(new FileReader(arquivo))) {
            String linha;
            while ((linha = buffer.readLine()) != null) {
                String[] valores = linha.split(";");
                if (valores[0].equalsIgnoreCase(nome)) {
                    return true;
                }
            }
        } catch (IOException e) {
            System.out.println("Erro ao verificar duplicatas");
        }
        return false;
    }

    public void editarCampoSeparado(String nome) {
        Scanner leia = new Scanner(System.in);
        StringBuilder temp = new StringBuilder();

        try (BufferedReader buffer = new BufferedReader(new FileReader(arquivo))) {
            String linha;
            while ((linha = buffer.readLine()) != null) {
                String[] valores = linha.split(";");
                if (valores[0].equalsIgnoreCase(nome)) {
                    System.out.println("1. Editar Nome");
                    System.out.println("2. Editar Telefone");
                    System.out.println("3. Editar Email");
                    int op = leia.nextInt();
                    leia.nextLine();
                    switch (op) {
                        case 1 -> {
                            System.out.print("Novo nome: ");
                            valores[0] = leia.nextLine();
                        }
                        case 2 -> {
                            System.out.print("Novo telefone: ");
                            valores[1] = leia.nextLine();
                        }
                        case 3 -> {
                            System.out.print("Novo email: ");
                            valores[2] = leia.nextLine();
                        }
                    }
                    linha = String.join(";", valores);
                }
                temp.append(linha).append("\n");
            }
        } catch (IOException e) {
            System.out.println("Erro ao editar separadamente");
        }

        try (BufferedWriter buffer = new BufferedWriter(new FileWriter(arquivo))) {
            buffer.write(temp.toString());
        } catch (IOException e) {
            System.out.println("Erro ao salvar alterações");
        }
    }

    public void buscarPorParteDoNome(String termo) {
        try (BufferedReader buffer = new BufferedReader(new FileReader(arquivo))) {
            String linha;
            boolean encontrou = false;
            while ((linha = buffer.readLine()) != null) {
                if (linha.toLowerCase().contains(termo.toLowerCase())) {
                    String[] valores = linha.split(";");
                    System.out.println("Nome: " + valores[0] + " | Tel: " + valores[1] + " | Email: " + valores[2]);
                    encontrou = true;
                }
            }
            if (!encontrou) {
                System.out.println("Nenhum contato encontrado.");
            }
        } catch (IOException e) {
            System.out.println("Erro na busca");
        }
    }

    public void editarPorTelefone(String telefone, Contato novo) {
        StringBuilder temp = new StringBuilder();
        try (BufferedReader buffer = new BufferedReader(new FileReader(arquivo))) {
            String linha;
            while ((linha = buffer.readLine()) != null) {
                String[] valores = linha.split(";");
                if (valores[1].equals(telefone)) {
                    linha = novo.getNome() + ";" + novo.getTelefone() + ";" + novo.getEmail();
                }
                temp.append(linha).append("\n");
            }
        } catch (IOException e) {
            System.out.println("Erro na edição");
        }

        try (BufferedWriter buffer = new BufferedWriter(new FileWriter(arquivo))) {
            buffer.write(temp.toString());
        } catch (IOException e) {
            System.out.println("Erro ao salvar");
        }
    }

    public void excluirPorTelefone(String telefone) {
        StringBuilder temp = new StringBuilder();
        try (BufferedReader buffer = new BufferedReader(new FileReader(arquivo))) {
            String linha;
            while ((linha = buffer.readLine()) != null) {
                String[] valores = linha.split(";");
                if (!valores[1].equals(telefone)) {
                    temp.append(linha).append("\n");
                }
            }
        } catch (IOException e) {
            System.out.println("Erro na exclusão");
        }

        try (BufferedWriter buffer = new BufferedWriter(new FileWriter(arquivo))) {
            buffer.write(temp.toString());
        } catch (IOException e) {
            System.out.println("Erro ao salvar alterações");
        }
    }

    public void listarOrdenado() {
        List<Contato> contatos = new ArrayList<>();
        try (BufferedReader buffer = new BufferedReader(new FileReader(arquivo))) {
            String linha;
            while ((linha = buffer.readLine()) != null) {
                String[] valores = linha.split(";");
                contatos.add(new Contato(valores[0], valores[1], valores[2]));
            }
        } catch (IOException e) {
            System.out.println("Erro na leitura");
        }

        contatos.sort(Comparator.comparing(Contato::getNome));
        for (Contato c : contatos) {
            System.out.println("Nome: " + c.getNome() + " | Tel: " + c.getTelefone() + " | Email: " + c.getEmail());
        }
    }

    public void exportarBackup() {
        try (BufferedReader buffer = new BufferedReader(new FileReader(arquivo)); BufferedWriter backup = new BufferedWriter(new FileWriter("backup_" + arquivo))) {
            String linha;
            while ((linha = buffer.readLine()) != null) {
                backup.write(linha);
                backup.newLine();
            }
            System.out.println("Backup salvo como: backup_" + arquivo);
        } catch (IOException e) {
            System.out.println("Erro ao criar backup");
        }
    }

    public static void listarArquivosAgenda() {
        File pasta = new File(".");
        File[] arquivos = pasta.listFiles((dir, name) -> name.endsWith(".txt"));
        System.out.println("Arquivos de agenda disponíveis:");
        if (arquivos != null) {
            for (File a : arquivos) {
                System.out.println("- " + a.getName());
            }
        }
    }
}