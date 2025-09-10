package Lista4.src.br.com.leonardovieira.exercicio2;

public class PrincipalLojaVeiculos {
    public static void main(String[] args) {
        LojaVeiculos loja = new LojaVeiculos("Auto Marcas");

        loja.venderVeiculo(50000.0);
        loja.venderVeiculo(30000.0);
        loja.venderVeiculo(45000.0);
   
        loja.darDesconto(10000.0);
        loja.darDesconto(5000.0);
    
        System.out.println("\nFaturamento final da loja: R$ " + loja.getFaturamento());
    }
}

