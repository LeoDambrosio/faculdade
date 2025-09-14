package br.com.leonardovieira.padroes.comportamentais.iterator;

/**
 *
 *
 * O padrão de projeto Iterator é utilizado para fornecer uma maneira de acessar
 * os elementos de um objeto agregado sequencialmente, sem expor sua
 * representação subjacente. Ele permite percorrer uma coleção sem precisar
 * conhecer sua estrutura interna.
 *
 * Explicação: Iterador.java: A interface que define os métodos essenciais para
 * um iterador: temProximo() (que verifica se ainda há elementos a serem
 * iterados) e proximo() (que retorna o próximo elemento na sequência).
 *
 * ColecaoAgregada.java: A interface para a coleção que poderá ser iterada. Ela
 * declara um método criarIterador() que retorna um objeto do tipo Iterador.
 *
 * ColecaoDeNomes.java: Esta classe implementa ColecaoAgregada e possui um array
 * de strings (nomes). A classe contém uma classe interna (IteradorDeNomes) que
 * implementa o iterador para a coleção de nomes.
 *
 * Cliente.java: A classe cliente onde uma coleção de nomes é criada, um
 * iterador é obtido a partir dessa coleção, e o iterador é usado para percorrer
 * e imprimir os nomes na coleção.
 */
public class Principal {

    public static void main(String[] args) {
        String[] nomes = {"Guilherme", "Patricia", "Luis", "Heloisa"};
        ColecaoDeNomes colecao = new ColecaoDeNomes(nomes);

        Iterador<String> iterador = colecao.criarIterador(); 

        while (iterador.temProximo()) {
            String nome = iterador.proximo();
            System.out.println(nome);
        }
    }
}
