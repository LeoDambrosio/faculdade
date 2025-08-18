package br.com.guilhermevillaca.padroes.exercicios.comportamental1;

/**
 *
 * @author 10380
 *
 * Explicação: Interface Observer:
 *
 * Define o método atualizar(String noticia) que os observadores devem
 * implementar para receber as atualizações. Classe Noticia:
 *
 * Mantém uma lista de observadores (observadores). Permite adicionar e remover
 * observadores. Notifica todos os observadores com o método
 * notificarObservadores() sempre que uma nova notícia é publicada. Classes
 * Leitor e Jornalista:
 *
 * Implementam a interface Observer e fornecem a implementação do método
 * atualizar, que exibe a notícia recebida. Classe Principal:
 *
 * Cria instâncias de Noticia, Leitor, e Jornalista. Adiciona observadores à
 * Noticia e publica novas notícias para demonstrar o padrão Observer em ação.
 */
public class Principal {

    public static void main(String[] args) {
        // Criar o sujeito (Noticia)
        Noticia noticia = new Noticia();

        // Criar observadores
        Leitor leitor1 = new Leitor("Carlos");
        Leitor leitor2 = new Leitor("Ana");
        Jornalista jornalista1 = new Jornalista("Pedro");
        Jornalista jornalista2 = new Jornalista("Maria");

        // Adicionar observadores ao sujeito
        noticia.adicionarObservador(leitor1);
        noticia.adicionarObservador(leitor2);
        noticia.adicionarObservador(jornalista1);
        noticia.adicionarObservador(jornalista2);

        // Publicar uma nova notícia
        noticia.publicarNoticia("Nova lei de proteção de dados entra em vigor.");

        // Remover um observador e publicar uma nova notícia
        noticia.removerObservador(jornalista2);
        noticia.publicarNoticia("Resultados da eleição foram divulgados.");
    }

}
