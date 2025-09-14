package br.com.guilhermevillaca.padroes.exercicios.comportamental2;

/**
 *
 * @author 10380
 *
 * Explicação: Interface EstrategiaDesconto:
 *
 * Define o método calcularDesconto(double valor), que deve ser implementado por
 * todas as estratégias de desconto. Classes de Estratégias de Desconto:
 *
 * DescontoQuantidade: Aplica um desconto de 10% se a quantidade de itens for
 * maior que 10. DescontoTemporada: Aplica um desconto de 15% durante a
 * temporada de verão. DescontoMembroVIP: Aplica um desconto de 20% para membros
 * VIP. Classe CarrinhoDeCompras:
 *
 * Permite definir a estratégia de desconto a ser usada (setEstrategiaDesconto).
 * Calcula o valor final do carrinho aplicando o desconto definido
 * (calcularValorFinal). Classe Principal:
 *
 * Cria uma instância de CarrinhoDeCompras com um valor total. Aplica diferentes
 * estratégias de desconto e exibe o valor final com o desconto aplicado.
 */
public class Principal {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // Criar um carrinho de compras com valor total
        CarrinhoDeCompras carrinho = new CarrinhoDeCompras(1000.0);

        // Aplicar desconto por quantidade
        carrinho.setEstrategiaDesconto(new DescontoQuantidade(15));
        System.out.println("Valor final com desconto por quantidade: R$ " + carrinho.calcularValorFinal());

        // Aplicar desconto de temporada
        carrinho.setEstrategiaDesconto(new DescontoTemporada("verão"));
        System.out.println("Valor final com desconto de temporada: R$ " + carrinho.calcularValorFinal());

        // Aplicar desconto de membro VIP
        carrinho.setEstrategiaDesconto(new DescontoMembroVIP());
        System.out.println("Valor final com desconto de membro VIP: R$ " + carrinho.calcularValorFinal());
    }
}
