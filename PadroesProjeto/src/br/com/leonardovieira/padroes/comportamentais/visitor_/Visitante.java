package br.com.leonardovieira.padroes.comportamentais.visitor_;

 
public interface Visitante {

    void visitar(Livro livro);

    void visitar(Fruta fruta);
}
