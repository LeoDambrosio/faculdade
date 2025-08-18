package br.com.guilhermevillaca.antipadroes.estruturais.adapter;

/*
 *  Problemas do Código Errado (Antipadrão)
Acoplamento Excessivo

A classe SistemaDePagamento sabe demais sobre os dois sistemas e tem lógica interna para decidir qual usar.
Código Difícil de Manter

Se houver um terceiro sistema de pagamento no futuro, teríamos que modificar SistemaDePagamento novamente.
Violação do Princípio Aberto/Fechado (OCP)

O código não está aberto para extensão: sempre que um novo sistema surgir, precisamos modificar a classe SistemaDePagamento.
 */
public class Principal {
    
    public static void main(String[] args) {
        SistemaDePagamento sistema = new SistemaDePagamento(false);
        sistema.realizarPagamento(100.00); // Usa sistema antigo

        SistemaDePagamento sistemaNovo = new SistemaDePagamento(true);
        sistemaNovo.realizarPagamento(200.00); // Usa sistema novo
    }
}
