package br.com.leonardovieira.padroes.comportamentais.chainofresponsability;

/**
 *
 *
 * padrão de projeto Chain of Responsibility é utilizado quando você deseja
 * passar uma solicitação ao longo de uma cadeia de manipuladores até que um
 * deles a processe. Cada manipulador na cadeia decide se processa a solicitação
 * ou a passa para o próximo manipulador. 
 * 
 * 
 * ✅ Benefícios do Chain of Responsibility
✅ Código modular: Cada regra de validação é uma classe separada.
✅ Fácil manutenção: Para adicionar uma nova regra, basta criar um novo Handler e colocá-lo na cadeia.
✅ Melhor reutilização: Podemos reutilizar regras em outros contextos facilmente.
✅ Flexível: Podemos mudar a ordem das verificações sem alterar cada método manualmente.

Agora o código está limpo, organizado e pronto para futuras expansões! 🚀
 */
public class Principal {
// Classe principal para testar
    public static void main(String[] args) {
        // Criando os handlers
        Handler validacao = new ValidacaoValorHandler();
        Handler saldo = new VerificarSaldoHandler();
        Handler limite = new VerificarLimiteHandler();
        Handler banco = new VerificarBancoHandler();
        Handler processador = new ProcessarPagamentoHandler();

        // Encadeando os handlers na ordem correta
        validacao.setProximo(saldo);
        saldo.setProximo(limite);
        limite.setProximo(banco);
        banco.setProximo(processador);

        // Testando o Chain of Responsibility
        System.out.println("Tentando processar pagamento de R$300 para João:");
        validacao.processar("João", 300);

        System.out.println("\nTentando processar pagamento de R$700 para Maria:");
        validacao.processar("Maria", 700);
    }
}