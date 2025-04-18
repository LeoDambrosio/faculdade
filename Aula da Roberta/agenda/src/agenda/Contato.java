/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/*
 * Classe que representa um contato na agenda.
 */
package agenda;

/**
 * Representa um Contato com nome, telefone e email.
 * A classe inclui um construtor padrão e um construtor parametrizado,
 * além de métodos getter e setter para manipulação dos atributos.
 * 
 * @author 10253
 */
public class Contato {
    // Atributo que armazena o nome do contato.
    private String nome;
    
    // Atributo que armazena o telefone do contato.
    private String telefone;
    
    // Atributo que armazena o email do contato.
    private String email;

    // Construtor padrão sem parâmetros, utilizado para inicializar um objeto vazio.
    public Contato() {
    }

    // Construtor parametrizado que inicializa o objeto com os valores fornecidos.
    // @param nome Nome do contato.
    // @param telefone Telefone do contato.
    // @param email Email do contato.
    public Contato(String nome, String telefone, String email) {
        this.nome = nome;
        this.telefone = telefone;
        this.email = email;
    }

    // Método getter para obter o nome do contato.
    // @return nome do contato.
    public String getNome() {
        return nome;
    }

    // Método setter para definir o nome do contato.
    // @param nome Nome a ser atribuído ao contato.
    public void setNome(String nome) {
        this.nome = nome;
    }

    // Método getter para obter o telefone do contato.
    // @return telefone do contato.
    public String getTelefone() {
        return telefone;
    }

    // Método setter para definir o telefone do contato.
    // @param telefone Telefone a ser atribuído ao contato.
    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    // Método getter para obter o email do contato.
    // @return email do contato.
    public String getEmail() {
        return email;
    }

    // Método setter para definir o email do contato.
    // @param email Email a ser atribuído ao contato.
    public void setEmail(String email) {
        this.email = email;
    }
}
