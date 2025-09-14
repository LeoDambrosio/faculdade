package br.com.leonardovieira.padroes.comportamentais.visitor2;
 
public interface Visitante {

    void visitar(Livro livro);

    void visitar(Fruta fruta);
}
