public class ContaCorrente extends Conta implements Tributavel {

    public void sacar(double valor) {
        double taxa = 0.10;
        super.sacar(valor + taxa);
    }

    @Override
    public double calcularTributos() {
        return this.saldo * 0.01;
    }
}
