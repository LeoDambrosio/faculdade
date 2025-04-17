package agenda;

import java.io.*;
import java.util.*;

public class Teste {
    public static void main(String[] args) {
        Scanner leia = new Scanner(System.in);
        String nomeArquivo;

        System.out.println("Digite o nome do arquivo da agenda (ex: contatos.txt):");
        nomeArquivo = leia.nextLine();
        Persistencia persistencia = new Persistencia(nomeArquivo);

        int opcao;
        do {
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
            opcao = leia.nextInt(); leia.nextLine();

            switch (opcao) {
                case 1 -> {
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
                case 2 -> persistencia.listarContatos();
                case 3 -> {
                    System.out.print("Nome do contato: ");
                    String nome = leia.nextLine();
                    Contato novo = new Contato();
                    System.out.print("Novo nome: "); novo.setNome(leia.nextLine());
                    System.out.print("Novo telefone: "); novo.setTelefone(leia.nextLine());
                    System.out.print("Novo email: "); novo.setEmail(leia.nextLine());
                    persistencia.editar(nome, novo);
                }
                case 4 -> {
                    System.out.print("Nome do contato a excluir: ");
                    String nome = leia.nextLine();
                    System.out.print("Tem certeza? (s/n): ");
                    if (leia.nextLine().equalsIgnoreCase("s")) {
                        persistencia.excluir(nome);
                    }
                }
                case 5 -> {
                    System.out.print("Nome para edição inteligente: ");
                    persistencia.editarCampoSeparado(leia.nextLine());
                }
                case 6 -> {
                    System.out.print("Parte do nome: ");
                    persistencia.buscarPorParteDoNome(leia.nextLine());
                }
                case 7 -> {
                    System.out.print("Telefone do contato: ");
                    String tel = leia.nextLine();
                    Contato novo = new Contato();
                    System.out.print("Novo nome: "); novo.setNome(leia.nextLine());
                    System.out.print("Novo telefone: "); novo.setTelefone(leia.nextLine());
                    System.out.print("Novo email: "); novo.setEmail(leia.nextLine());
                    persistencia.editarPorTelefone(tel, novo);
                }
                case 8 -> {
                    System.out.print("Telefone do contato: ");
                    String tel = leia.nextLine();
                    persistencia.excluirPorTelefone(tel);
                }
                case 9 -> persistencia.listarOrdenado();
                case 10 -> persistencia.exportarBackup();
                case 11 -> Persistencia.listarArquivosAgenda();
                case 12 -> {
                    System.out.print("Novo nome do arquivo: ");
                    nomeArquivo = leia.nextLine();
                    persistencia = new Persistencia(nomeArquivo);
                }
                case 0 -> System.out.println("Saindo...");
                default -> System.out.println("Opção inválida");
            }

        } while (opcao != 0);
        leia.close();
    }
}
