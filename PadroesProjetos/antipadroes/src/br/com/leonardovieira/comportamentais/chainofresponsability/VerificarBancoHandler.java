package antipadroes.src.br.com.leonardovieira.comportamentais.chainofresponsability;

public class VerificarBancoHandler extends AbstractHandler {

    @Override
    public void processar(String usuario, double valor){
        if(bancoDisponivel()){
            System.out.println("Erro: Banco indisponivel para transacoes");
            return;
        }
        chamarProximo(usuario, valor);
    }

    private boolean bancoDisponivel(){
        return true;
    }
}
