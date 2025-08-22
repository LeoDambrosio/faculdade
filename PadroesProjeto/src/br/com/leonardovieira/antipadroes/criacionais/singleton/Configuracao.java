package br.com.leonardovieira.antipadroes.criacionais.singleton;
class Configuracao {
    public static Configuracao instanciaGlobal = new Configuracao(); // Variável global
    
    public String configuracaoSistema;

    public Configuracao() {  // Construtor público sem restrições
        configuracaoSistema = "Config Padrão";
    }
}