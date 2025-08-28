package br.com.leonardovieira.padroes.comportamentais.interpreter;

import java.util.Arrays;
import java.util.List;

public class Principal {

    public static void main(String[] args) {
        List<Artigo> artigos = Arrays.asList(
            new Artigo("Aquitetura de Software Moderna"),
            new Artigo("Padrao MVC na Web"),
            new Artigo("Padroes de Projeto e Arquitetura"),
            new Artigo("Introducao a Inteligencia Artificial"),
            new Artigo("Model View Controller na Pratica"),
            new Artigo("Arquitetura de Software e Model View Controller"),
            new Artigo("Arquitetura de Software e MVC")
        );

        Expressao termo1 = new Palavra("arquitetura de software");
        Expressao termo2 = new Palavra("mvc");
        Expressao termo3 = new Palavra("model view controller");

        Expressao or = new OrExpressao(termo2, termo3);
        Expressao query = new AndExpressao(termo1, or);

        for(Artigo artigo: artigos){
            if(query.interpretar(artigo)){
                System.out.println("Encontrado: " + artigo.getTitulo());
            }
        }
    }
}
