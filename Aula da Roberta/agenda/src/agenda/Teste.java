package agenda; // Define o pacote ao qual esta classe pertence

import java.io.*; // Importa todas as classes necessárias para manipulação de arquivos
import java.util.*; // Importa utilitários como Scanner, List, etc.

public class Teste {
    public static void main(String[] args) {
        Scanner leia = new Scanner(System.in); // Cria objeto Scanner para entrada do usuário
        String nomeArquivo;

        // Solicita ao usuário o nome do arquivo que será usado como agenda
        System.out.println("Digite o nome do arquivo da agenda (ex: contatos.txt):");
        nomeArquivo = leia.nextLine();
        Persistencia persistencia = new Persistencia(nomeArquivo); // Instancia a classe Persistencia com o nome do arquivo

        int opcao;
        do {
            // Exibe o menu de opções para o usuário
            System.out.println("\n----MENU AGENDA DE CONTATOS----");
            System.out.println("Arquivo atual: " + nomeArquivo);
            System.out.println("1. Adicionar Contato");
            System.out.println("2. Listar Contatos");
            System.out.println("3. Editar Contato");
            System.out.println("4. Excluir Contato");
            System.out.println("5. Edição Inteligente");
            System.out.println("6. Buscar por Parte do Nome");
            System.out.println("7. Editar por Telefone");
            System.out.println("8. Excluir por Telefone");
            System.out.println("9. Listar Ordenado");
            System.out.println("10. Exportar Backup");
            System.out.println("11. Listar Arquivos");
            System.out.println("12. Trocar de Arquivo");
            System.out.println("0. Sair");
            System.out.print("Escolha uma opção: ");
            opcao = leia.nextInt(); leia.nextLine(); // Lê a opção escolhida pelo usuário

            switch (opcao) {
                case 1 -> {
                    // Adiciona um novo contato
                    Contato c = new Contato();
                    System.out.print("Nome: ");
                    c.setNome(leia.nextLine());
                    if (persistencia.contatoJaExiste(c.getNome())) {
                        System.out.println("Contato já existe! Operação cancelada.");
                        break;
                    }
                    System.out.print("Telefone: ");
                    c.setTelefone(leia.nextLine());
                    System.out.print("Email: ");
                    c.setEmail(leia.nextLine());
                    persistencia.inserir(c);
                }
                case 2 -> persistencia.listarContatos(); // Lista os contatos cadastrados
                case 3 -> {
                    // Edita um contato com base no nome
                    System.out.print("Nome do contato: ");
                    String nome = leia.nextLine();
                    Contato novo = new Contato();
                    System.out.print("Novo nome: "); novo.setNome(leia.nextLine());
                    System.out.print("Novo telefone: "); novo.setTelefone(leia.nextLine());
                    System.out.print("Novo email: "); novo.setEmail(leia.nextLine());
                    persistencia.editar(nome, novo);
                }
                case 4 -> {
                    // Exclui um contato após confirmação
                    System.out.print("Nome do contato a excluir: ");
                    String nome = leia.nextLine();
                    System.out.print("Tem certeza? (s/n): ");
                    if (leia.nextLine().equalsIgnoreCase("s")) {
                        persistencia.excluir(nome);
                    }
                }
                case 5 -> {
                    // Edição de apenas um campo do contato
                    System.out.print("Nome para edição inteligente: ");
                    persistencia.editarCampoSeparado(leia.nextLine());
                }
                case 6 -> {
                    // Busca um contato por parte do nome
                    System.out.print("Parte do nome: ");
                    persistencia.buscarPorParteDoNome(leia.nextLine());
                }
                case 7 -> {
                    // Edita um contato com base no telefone
                    System.out.print("Telefone do contato: ");
                    String tel = leia.nextLine();
                    Contato novo = new Contato();
                    System.out.print("Novo nome: "); novo.setNome(leia.nextLine());
                    System.out.print("Novo telefone: "); novo.setTelefone(leia.nextLine());
                    System.out.print("Novo email: "); novo.setEmail(leia.nextLine());
                    persistencia.editarPorTelefone(tel, novo);
                }
                case 8 -> {
                    // Exclui um contato pelo telefone
                    System.out.print("Telefone do contato: ");
                    String tel = leia.nextLine();
                    persistencia.excluirPorTelefone(tel);
                }
                case 9 -> persistencia.listarOrdenado(); // Lista os contatos em ordem alfabética
                case 10 -> persistencia.exportarBackup(); // Cria um backup do arquivo atual
                case 11 -> Persistencia.listarArquivosAgenda(); // Lista os arquivos .txt disponíveis
                case 12 -> {
                    // Troca o arquivo de agenda utilizado
                    System.out.print("Novo nome do arquivo: ");
                    nomeArquivo = leia.nextLine();
                    persistencia = new Persistencia(nomeArquivo);
                }
                case 0 -> System.out.println("Saindo..."); // Sai do programa
                default -> System.out.println("Opção inválida"); // Opção inválida
            }

        } while (opcao != 0); // Repete até o usuário escolher sair
        leia.close(); // Fecha o Scanner
    }
}
