package br.com.guilhermevillaca.antipadroes.estruturais.flyweight;

import java.util.ArrayList;
import java.util.List;

/*
 * 
 * Problema: Cada instância de Caractere ocupa espaço individualmente, mesmo que os caracteres tenham a mesma formatação.
 * 
 */
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
