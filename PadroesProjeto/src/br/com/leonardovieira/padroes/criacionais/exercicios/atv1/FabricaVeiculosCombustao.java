package br.com.guilhermevillaca.padroes.criacionais.exercicios.atv1;

/**
 *
 * @author villaca
 */
public class FabricaVeiculosCombustao implements FabricaVeiculo{

    @Override
    public Carro criarCarro() {
        return new CarroCombustao();
    }

    @Override
    public Caminhao criarCaminhao() {
        return new CaminhaoCombustao();
    }

}
