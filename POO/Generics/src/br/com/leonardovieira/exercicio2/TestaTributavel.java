public class TestaTributavel {
    
    public static void main(String[] args) {

        ContaCorrente cc = new ContaCorrente();
        
        cc.depositar(1000);
        
        System.out.println("Saldo da conta: " + cc.obterSaldo());
        
        System.out.println("Tributos da conta: " + cc.calcularTributos());
        
        SeguroDeVida sv = new SeguroDeVida();
        
        System.out.println("Tributos do seguro de vida: " + sv.calcularTributos());
        
        System.out.println("\n=== Demonstração de polimorfismo ===");
        Tributavel[] tributaveis = new Tributavel[2];
        tributaveis[0] = cc;
        tributaveis[1] = sv;
        
        for (Tributavel t : tributaveis) {
            System.out.println("Tributo: " + t.calcularTributos());
        }
    }
}