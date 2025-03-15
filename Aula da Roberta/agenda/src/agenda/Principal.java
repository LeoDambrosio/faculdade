package agenda;

public class Principal {

    public static void main(String[] args) {
        // TODO code application logic here
        String nome = "Luke Skywalker";
        String telefone = "(45)99999-9999";
        String email = "luke@gmail.com";
        Contato contato = new Contato(nome, telefone, email);
        
        Persistencia persistencia = new Persistencia();
        persistencia.criarArquivo();
        persistencia.inserir(contato);
    }

}
