package br.com.guilhermevillaca.antipadroes.comportamentais.chainofresponsability;

class PagamentoProcessor {

    public void processarPagamento(String usuario, double valor) {
        // Verifica se o valor do pagamento é válido
        if (valor <= 0) {
            System.out.println("Erro: O valor do pagamento deve ser maior que zero.");
            return;
        }

        // Verifica saldo do usuário
        if (!verificarSaldo(usuario, valor)) {
            System.out.println("Erro: Saldo insuficiente para " + usuario);
            return;
        }

        // Verifica limite do usuário
        if (!verificarLimite(usuario, valor)) {
            System.out.println("Erro: Pagamento excede o limite permitido.");
            return;
        }

        // Verifica se o banco está disponível
        if (!bancoDisponivel()) {
            System.out.println("Erro: Banco indisponível para transações.");
            return;
        }

        // Se tudo estiver certo, processa o pagamento
        System.out.println("Pagamento de R$" + valor + " processado com sucesso para " + usuario);
    }

    private boolean verificarSaldo(String usuario, double valor) {
        return valor <= 1000; // Simulação: saldo máximo de 1000
    }

    private boolean verificarLimite(String usuario, double valor) {
        return valor <= 500; // Simulação: limite máximo de 500 por transação
    }

    private boolean bancoDisponivel() {
        return true; // Simulação: banco sempre disponível
    }
}

