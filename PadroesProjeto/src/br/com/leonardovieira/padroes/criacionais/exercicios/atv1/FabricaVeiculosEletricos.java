package br.com.guilhermevillaca.padroes.criacionais.exercicios.atv1;

/**
 *
 * @author villaca
 */
public class FabricaVeiculosEletricos implements FabricaVeiculo{

    @Override
    public Carro criarCarro() {
        return new CarroEletrico();
    }

    @Override
    public Caminhao criarCaminhao() {
        return new CaminhaoEletrico();
    }

}
