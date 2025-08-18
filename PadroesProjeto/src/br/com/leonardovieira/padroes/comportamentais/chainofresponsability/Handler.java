package br.com.guilhermevillaca.padroes.comportamentais.chainofresponsability;

// Interface para os handlers da cadeia
interface Handler {
    void setProximo(Handler proximo);
    void processar(String usuario, double valor);
}








