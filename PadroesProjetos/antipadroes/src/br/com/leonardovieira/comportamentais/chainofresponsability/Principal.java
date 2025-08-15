package antipadroes.src.br.com.leonardovieira.comportamentais.chainofresponsability;

import java.util.logging.Handler;

import antipadroes.src.br.com.leonardovieira.comportamentais.chainofresponsability.ValidacaoValorHandler;
import antipadroes.src.br.com.leonardovieira.comportamentais.chainofresponsability.VerificarSaldo;
import antipadroes.src.br.com.leonardovieira.comportamentais.chainofresponsability.VerifocarLimiteHandler;

public class Principal {

    public static void main(String[] args) {
        Handler validacao = new ValidacaoValorHandler();
        Handler saldo =  new VerificarSaldo();
        Handler limite =  new VerifocarLimiteHandler();
        Handler banco = new VerificarBancoHandler();
        Handler processarPagamento = new ProcessarPagamentoHandler();
        
        validacao.setProximo(saldo);
        saldo.setProximo(limite);
        limite.setProximo(banco);
        banco.setProximo(ProcessarPagamento);

        System.err.println("Tentando processar pagamento de 300R$ para Joâo");
        validacao.processar(usuario: "João", valor:700);

        System.err.println("---------------------");
        System.out.println("Tentando processar pagamento de 700R$ para Maria");
        validacao.processar(usuario:"Maria", valor:700);       
    }
}
