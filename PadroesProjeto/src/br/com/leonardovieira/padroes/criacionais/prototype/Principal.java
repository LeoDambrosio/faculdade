package br.com.guilhermevillaca.padroes.criacionais.prototype;

/**
 *
 * @author villaca
 */

/*

Padrão de Projeto Prototype
O padrão Prototype é um padrão de criação que permite copiar objetos existentes 
sem depender de suas classes concretas, garantindo que as novas instâncias sejam 
independentes das originais. Isso é útil quando a criação direta de objetos é 
cara ou complexa.

Exemplo em Texto
Imagine que você tem um sistema que gerencia documentos. Cada documento pode ter 
várias configurações e conteúdos. Criar um novo documento do zero pode ser trabalhoso, 
então, em vez disso, você pode criar um documento básico e, quando precisar de um novo, 
simplesmente clonar o documento existente e fazer as alterações necessárias.

Explicação
Cloneable.java: Define a interface Cloneable com um método clone().
Documento.java: Define a classe Documento que implementa a interface Cloneable. 
O método clone() retorna uma nova instância de Documento com os mesmos valores de 
atributos.
Main.java: Testa a clonagem de um documento e mostra como modificar o clone sem afetar 
o original.

*/
public class Principal {

    public static void main(String[] args) {
        Documento documentoOriginal = new Documento("Título Original", "Conteúdo Original");
        System.out.println("Documento Original: " + documentoOriginal);

        // Clonando o documento
        Documento documentoClone = documentoOriginal.clone();
        System.out.println("Documento Clone: " + documentoClone);

        // Alterando o clone
        documentoClone.setTitulo("Título do Clone");
        documentoClone.setConteudo("Conteúdo do Clone");

        System.out.println("\nApós modificar o clone:");
        System.out.println("Documento Original: " + documentoOriginal);
        System.out.println("Documento Clone: " + documentoClone);
    }
}
