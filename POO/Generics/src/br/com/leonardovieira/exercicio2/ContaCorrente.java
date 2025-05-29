public class ContaCorrente extends Conta implements Tributavel {
    @Override
    public double calculaTributos() {
        return saldo * 0.01; 
    }
}
