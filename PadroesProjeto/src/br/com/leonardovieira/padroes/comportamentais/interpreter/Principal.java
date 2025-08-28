package br.com.leonardovieira.padroes.comportamentais.interpreter;

import java.lang.reflect.Array;
import java.util.List;

public class Principal {

    public static void main(String[] args) {
        
        List<Artigo> artigo = Array.asList(
            new Artigo(titulo:"Aquitetura de Sofware Moderna"),
            new Artigo(titulo:"Padrao MVC na Web"),
            new Artigo(titulo:"Padroes de Projeto e Arquitetura"),
            new Artigo(titulo:"Introducao a Inteligencia Artificial"),
            new Artigo(titulo:"Model View Controller na Pratica")
        );

        Expressao termo1 = new Palavra(termo:"arquitetura de sofware");
        Expressao termo2 = new Palavra(termo:"mvc");
        Expressao termo3 = new Palavra(termo:"model view controller");

        Expressao or = new OrExpressao(termo2, termo3);
        Expressao query = new AndExpressao(termo1, or);

        for(Artigo artigo: artigos){
            if(query.interpretar(artigo)){
                System.out.println("Encontrado: " + artigo.getTitulo());
            }
        }
    }
}
