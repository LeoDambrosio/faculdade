public class ContaCorrente extends Conta implements Tributavel{
    @Override
    public double calcularTributos() {
        return saldo * 0.01;
    }

}
