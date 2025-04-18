package agenda; // Define o pacote onde a classe está localizada

import java.io.BufferedReader; // Para leitura de arquivos
import java.io.BufferedWriter; // Para escrita em arquivos
import java.io.File; // Representação de arquivos no sistema
import java.io.FileReader; // Leitura de arquivos texto
import java.io.FileWriter; // Escrita em arquivos texto
import java.io.IOException; // Para tratamento de exceções de I/O
import java.util.ArrayList; // Lista dinâmica
import java.util.Comparator; // Comparador para ordenação
import java.util.List; // Interface de listas
import java.util.Scanner; // Leitura de entrada do usuário

public class Persistencia {

    private String arquivo; // Nome do arquivo utilizado pela agenda

    // Construtor que define o nome do arquivo e tenta criá-lo se ainda não existir
    public Persistencia(String nomeArquivo) {
        this.arquivo = nomeArquivo;
        criarArquivo();
    }

    // Método que tenta criar o arquivo
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

    // Insere um novo contato no arquivo
    public void inserir(Contato contato) {
        try (BufferedWriter buffer = new BufferedWriter(new FileWriter(arquivo, true))) {
            buffer.write(contato.getNome() + ";" + contato.getTelefone() + ";" + contato.getEmail());
            buffer.newLine();
        } catch (IOException ex) {
            System.out.println("Erro ao gravar contato");
        }
    }

    // Lista todos os contatos presentes no arquivo
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

    // Edita um contato com base no nome
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

    // Exclui um contato com base no nome informado
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

    // Verifica se já existe um contato com o mesmo nome
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

    // Permite editar separadamente o nome, telefone ou e-mail de um contato
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

    // Realiza busca parcial por nome
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

    // Edita um contato com base no telefone
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

    // Exclui um contato com base no telefone
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

    // Lista todos os contatos ordenados por nome
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

    // Exporta um backup do arquivo atual para um novo arquivo com prefixo "backup_"
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

    // Lista todos os arquivos .txt disponíveis no diretório atual
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
