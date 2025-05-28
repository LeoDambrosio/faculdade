public class TesteTributavel {
    public static void main(String[] args) {
        ContaCorrente cc = new ContaCorrente();
        cc.depositar(1000);

        System.out.println("Saldo da conta: " + cc.obterSaldo());
        System.out.println("Tributos da conta: " + cc.calcularTributos());

        SeguroDeVida sv = new SeguroDeVida();
        System.out.println("Tributos do seguro de vida: " + sv.calcularTributos());
    }

}
