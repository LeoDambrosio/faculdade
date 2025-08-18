package br.com.guilhermevillaca.padroes.criacionais.factorymethod;

/**
 *
 * @author villaca
 */
public abstract class Logistica {

    // Método Fábrica
    public abstract Transporte criarTransporte();

    // Método para organizar a entrega
    public void organizarEntrega() {
        Transporte transporte = criarTransporte();
        transporte.entregar();
    }

}
