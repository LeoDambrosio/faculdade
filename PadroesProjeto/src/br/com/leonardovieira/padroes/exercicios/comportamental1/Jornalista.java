package br.com.guilhermevillaca.padroes.exercicios.comportamental1;

/**
 *
 * @author guilherme.villaca
 */
public class Jornalista implements Observer {

    private String nome;

    public Jornalista(String nome) {
        this.nome = nome;
    }

    @Override
    public void atualizar(String noticia) {
        System.out.println("Jornalista " + nome + " recebeu a nova notícia: " + noticia);
    }
}
