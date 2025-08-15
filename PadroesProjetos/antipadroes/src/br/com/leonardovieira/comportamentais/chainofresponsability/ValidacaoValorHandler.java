package antipadroes.src.br.com.leonardovieira.comportamentais.chainofresponsability;

public class ValidacaoValorHandler extends AbstractHandler{

    @Override
    public void processar(String usuario, double valor){
        if(valor <= 0){
            System.out.println("Erro o valor do pagamento deve ser maoir que 0.");
            return;
        }
        chamarProximo(usuario, valor);
    }
}
    

