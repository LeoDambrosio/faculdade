package br.com.leonardovieira.antipadroes.criacionais.singleton;

public class Principal {

    public static void main(String[] args) {
        
            // Criando múltiplas instâncias (sem controle)
            Configuracao c1 = new Configuracao();
            Configuracao c2 = new Configuracao();
    
            c1.configuracaoSistema = "Modo Escuro";
    
            // As instâncias são diferentes
            System.out.println(c1.configuracaoSistema); // Saída: Modo Escuro
            System.out.println(c2.configuracaoSistema); // Saída: Config Padrão (diferente!)
        
    }
}