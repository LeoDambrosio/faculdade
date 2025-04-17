package agenda;

import java.util.Scanner;

public class Teste {
    public static void main(String[] args) {
        Scanner leia = new Scanner(System.in);
        String nomeArquivo;
        Persistencia persistencia;

        System.out.println("Digite o nome do arquivo da agenda (ex: agenda.txt):");
        nomeArquivo = leia.nextLine();
        persistencia = new Persistencia(nomeArquivo);

        int opcao;
        do {
            System.out.println("\n---- MENU AGENDA DE CONTATOS ----");
            System.out.println("Arquivo atual: " + nomeArquivo);
            System.out.println("1. Adicionar Contato");
            System.out.println("2. Listar Contatos");
            System.out.println("3. Editar Contato");
            System.out.println("4. Excluir Contato");
            System.out.println("5. Listar Arquivos de Agenda");
            System.out.println("6. Trocar Arquivo de Agenda");
            System.out.println("0. Sair");
            System.out.print("Escolha uma opção: ");
            opcao = leia.nextInt();
            leia.nextLine(); // limpar buffer

            switch (opcao) {
                case 1:
                    Contato c = new Contato();
                    System.out.print("Nome: ");
                    c.setNome(leia.nextLine());
                    System.out.print("Telefone: ");
                    c.setTelefone(leia.nextLine());
                    System.out.print("Email: ");
                    c.setEmail(leia.nextLine());
                    persistencia.inserir(c);
                    break;
                case 2:
                    persistencia.listarContatos();
                    break;
                case 3:
                    System.out.print("Nome do contato a editar: ");
                    String nomeAntigo = leia.nextLine();
                    Contato novoContato = new Contato();
                    System.out.print("Novo Nome: ");
                    novoContato.setNome(leia.nextLine());
                    System.out.print("Novo Telefone: ");
                    novoContato.setTelefone(leia.nextLine());
                    System.out.print("Novo Email: ");
                    novoContato.setEmail(leia.nextLine());
                    persistencia.editar(nomeAntigo, novoContato);
                    break;
                case 4:
                    System.out.print("Nome do contato a excluir: ");
                    String nomeExcluir = leia.nextLine();
                    persistencia.excluir(nomeExcluir);
                    break;
                case 5:
                    Persistencia.listarArquivosAgenda();
                    break;
                case 6:
                    System.out.print("Digite o novo nome do arquivo da agenda: ");
                    nomeArquivo = leia.nextLine();
                    persistencia = new Persistencia(nomeArquivo);
                    break;
                case 0:
                    System.out.println("Saindo do programa...");
                    break;
                default:
                    System.out.println("Opção inválida!");
            }

        } while (opcao != 0);

        leia.close();
    }
}
