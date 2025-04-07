package Lista4.src.br.com.leonardovieira.exercicio2;

public class LojaVeiculos {
    private String nomeLoja;
    private double faturamento;

    // Construtor
    public LojaVeiculos(String nomeLoja) {
        this.nomeLoja = nomeLoja;
        this.faturamento = 0.0;
    }

    public void venderVeiculo(double valor) {
        if (valor > 0) {
            faturamento += valor;
            System.out.println("Venda realizada: R$ " + valor);
        }
    }

    public void darDesconto(double valor) {
        if (valor > 0) {
            if (valor <= faturamento) {
                faturamento -= valor;
                System.out.println("Desconto aplicado: R$ " + valor);
            } else {
                System.out.println("Desconto maior que o faturamento. Operação ignorada.");
            }
        }
    }

    public double getFaturamento() {
        return faturamento;
    }
}

