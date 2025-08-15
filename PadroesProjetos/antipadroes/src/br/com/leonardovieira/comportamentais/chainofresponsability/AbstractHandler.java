package antipadroes.src.br.com.leonardovieira.comportamentais.chainofresponsability;


public abstract class AbstractHandler implements Handler {

    protected Handler proximo;

    @Override
    public void setProximo(Handler proximo){
        this.proximo = proximo;
    }

    protected void chamarProximo(String usuario, double valor){
        if(proximo != null){
            proximo.processar(usuario, valor);
        }
    }
}
