package br.com.leonardovieira.padroes.comportamentais.chainofresponsability;

// Handler para verificar saldo
public class VerificarSaldoHandler extends AbstractHandler {
    @Override
    public void processar(String usuario, double valor) {
        if (valor > 1000) {
            System.out.println("Erro: Saldo insuficiente para " + usuario);
            return;
        }
        chamarProximo(usuario, valor);
    }
}
