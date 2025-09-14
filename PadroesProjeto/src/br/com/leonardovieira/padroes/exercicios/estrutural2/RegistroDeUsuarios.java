package br.com.guilhermevillaca.padroes.exercicios.estrutural2;

/**
 *
 * @author guilherme.villaca
 */
public class RegistroDeUsuarios {

    public void registrarUsuario(String nome) {
        System.out.println("Usuário '" + nome + "' registrado.");
    }

    public boolean usuarioExistente(String nome) {        
        System.out.println("Usuário '" + nome + "' encontrado.");
        return true;
    }
}
