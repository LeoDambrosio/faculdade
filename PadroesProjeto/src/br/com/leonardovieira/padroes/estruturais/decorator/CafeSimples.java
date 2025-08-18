package br.com.guilhermevillaca.padroes.estruturais.decorator;

// ☕ Implementação básica do café
public class CafeSimples implements Cafe {
    @Override
    public double getPreco() {
        return 5.00;
    }

    @Override
    public String getDescricao() {
        return "Café simples";
    }
}