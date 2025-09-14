package br.com.leonardovieira.padroes.comportamentais.chainofresponsability;

// Handler base que implementa o encadeamento
public abstract class AbstractHandler implements Handler {
    protected Handler proximo;

    @Override
    public void setProximo(Handler proximo) {
        this.proximo = proximo;
    }

    protected void chamarProximo(String usuario, double valor) {
        if (proximo != null) {
            proximo.processar(usuario, valor);
        }
    }
}