package br.com.guilhermevillaca.padroes.exercicios.comportamental1;

/**
 *
 * @author guilherme.villaca
 */
public class Leitor implements Observer {

    private String nome;

    public Leitor(String nome) {
        this.nome = nome;
    }

    @Override
    public void atualizar(String noticia) {
        System.out.println("Leitor " + nome + " recebeu a nova notícia: " + noticia);
    }
}
