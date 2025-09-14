package br.com.leonardovieira.padroes.comportamentais.chainofresponsability;

// Handler para verificar limite do usuário
public class VerificarLimiteHandler extends AbstractHandler {
    @Override
    public void processar(String usuario, double valor) {
        if (valor > 500) {
            System.out.println("Erro: Pagamento excede o limite permitido.");
            return;
        }
        chamarProximo(usuario, valor);
    }
}
