package br.com.guilhermevillaca.antipadroes.criacionais.singleton;

/**
 * 
 * Antes de o Singleton ser formalizado, era comum criar variáveis globais ou gerenciar instâncias manualmente, como neste exemplo:
 * 
 * Múltiplas instâncias acidentais

Nada impede que new Configuracao() seja chamado várias vezes, criando objetos diferentes.
Se o objetivo era manter uma única configuração global, isso poderia causar inconsistências.
Uso de variáveis globais

A variável instanciaGlobal pode ser sobrescrita acidentalmente (Configuracao.instanciaGlobal = new Configuracao();).
Qualquer parte do código pode modificar a instância global, tornando o estado imprevisível.
Não é thread-safe

Se várias threads acessarem Configuracao simultaneamente, podem criar instâncias inesperadas ou sobrescrever valores.

O que mudou com o Singleton?
Com o padrão Singleton, garantimos: ✔ Uma única instância.
✔ Controle de acesso ao objeto.
✔ Segurança contra sobrescrita acidental.
✔ Melhor desempenho com inicialização sob demanda.

 */

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