package antipadroes.src.br.com.leonardovieira.comportamentais.chainofresponsability;

public class VerifocarLimiteHandler extends AbstractHandler{

    @Override
    public void processar(String usuario, double valor) {
        if(valor > 500){
            System.out.println("Erro: Pagamento excede o limite permitido");
            return;
        }
        chamarProximo(usuario, valor);
    }

}
