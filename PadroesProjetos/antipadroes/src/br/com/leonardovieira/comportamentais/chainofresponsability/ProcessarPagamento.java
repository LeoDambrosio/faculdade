package antipadroes.src.br.com.leonardovieira.comportamentais.chainofresponsability;

public class ProcessarPagamento extends AbstractHandler {

    @Override
    public void processar(String usuario, double valor) {
        System.out.println("Pagamento de R$ " + " realizado com sucesso para " + usuario);
    }

}
