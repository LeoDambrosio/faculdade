package br.com.guilhermevillaca.padroes.estruturais.adapter;

/**
 *
 * @author villaca

/**
* 
* Cenário
Temos uma interface antiga de pagamento (SistemaPagamentoAntigo) e 
uma nova interface de pagamento (SistemaPagamentoNovo). 
Queremos usar o novo sistema de pagamento sem modificar o código 
que depende da interface antiga. Vamos criar um adaptador (AdaptadorPagamento) 
que implementa a nova interface, mas usa o sistema antigo para processar 
pagamentos.

* Explicação
SistemaPagamentoAntigo: Classe que representa o sistema de pagamento legado 
com um método realizarPagamento.
SistemaPagamentoNovo: Interface que define a nova forma de processar 
pagamentos com o método processarPagamento.
AdaptadorPagamento: Classe adaptadora que implementa a interface 
SistemaPagamentoNovo e usa uma instância de SistemaPagamentoAntigo 
para processar pagamentos.
ClientePagamento: Classe principal que demonstra o uso do adaptador para 
processar um pagamento utilizando a nova interface.
Como Funciona
SistemaPagamentoAntigo tem um método realizarPagamento que aceita uma 
conta e um valor.
SistemaPagamentoNovo define um método processarPagamento que aceita um 
clienteId e um valor.
AdaptadorPagamento adapta a interface do novo sistema para que chame o
método do sistema antigo.
ClientePagamento usa AdaptadorPagamento para processar um pagamento, 
demonstrando como o adaptador permite que o novo código use a interface 
antiga sem mudanças significativas.

**/

public class Principal {
    
    public static void main(String[] args) {
        // Usando o sistema antigo com o Adapter
        SistemaDePagamento sistema1 = new SistemaDePagamento(new PagamentoAntigoAdapter());
        sistema1.realizarPagamento(100.00);

        // Usando o sistema novo diretamente
        SistemaDePagamento sistema2 = new SistemaDePagamento(new PagamentoNovoAdapter());
        sistema2.realizarPagamento(200.00);
    }
}
