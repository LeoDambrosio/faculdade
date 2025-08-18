package br.com.guilhermevillaca.antipadroes.criacionais.prototype;

public class Principal {
    public static void main(String[] args) {
        Documento doc1 = new Documento("Relatório", "Conteúdo do relatório...");
        Documento doc2 = doc1.copiar(); // Cópia manual

        doc2.exibir();
    }
}

