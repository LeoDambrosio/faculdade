package br.com.leonardovieira.antipadroes.estruturais.flyweight;

import java.util.ArrayList;
import java.util.List;

public class EditorTexto {

    public static void main(String[] args) {
        List<Caractere> texto = new ArrayList<>();

        texto.add(new Caractere('A', "Arial", 12));
        texto.add(new Caractere('A', "Arial", 12));
        texto.add(new Caractere('B', "Arial", 12));
        texto.add(new Caractere('C', "Arial", 12));

        for (Caractere c : texto) {
            c.exibir();
        }
    }

}
