package br.com.leonardovieira.padroes.comportamentais.state;

/**
 *
 * O padrão State é utilizado para permitir que um objeto altere seu
 * comportamento quando seu estado interno muda. Ele é muito útil quando um
 * objeto precisa mudar seu comportamento dependendo do seu estado atual, e
 * essas mudanças de comportamento são melhor organizadas em classes distintas.
 *
 * Exemplo: Máquina de Venda Automática Vamos implementar um exemplo em Java de
 * uma máquina de venda automática que pode estar em diferentes estados: Sem
 * Moeda, Com Moeda, Vendendo, e Sem Estoque. Dependendo do estado atual, a
 * máquina responderá de maneira diferente às ações do usuário.
 *
 * Explicação: A MaquinaVenda começa no estado SemMoedaState, onde espera que
 * uma moeda seja inserida. Quando uma moeda é inserida, o estado muda para
 * ComMoedaState, permitindo que a alavanca seja acionada. Após acionar a
 * alavanca, o estado muda para VendendoState, e o produto é dispensado. Se o
 * estoque acabar, a máquina muda para o estado SemEstoqueState, onde não aceita
 * mais moedas. Este exemplo mostra como o padrão State pode ser usado para
 * gerenciar de forma elegante e organizada os diferentes comportamentos de um
 * objeto em resposta a mudanças de estado.
 */
public class Principal {

    public static void main(String[] args) {
        // Cria uma máquina de venda com 2 produtos em estoque
        MaquinaVenda maquinaVenda = new MaquinaVenda(2);

        // Tenta acionar a alavanca sem inserir moeda
        maquinaVenda.acionarAlavanca();

        // Insere uma moeda e tenta acionar a alavanca
        maquinaVenda.inserirMoeda();
        maquinaVenda.acionarAlavanca();

        // Insere outra moeda e ejeta antes de acionar a alavanca
        maquinaVenda.inserirMoeda();
        maquinaVenda.ejetarMoeda();

        // Insere uma moeda e aciona a alavanca novamente
        maquinaVenda.inserirMoeda();
        maquinaVenda.acionarAlavanca();

        // Tenta comprar outro produto quando o estoque está vazio
        maquinaVenda.inserirMoeda();
    }
}
