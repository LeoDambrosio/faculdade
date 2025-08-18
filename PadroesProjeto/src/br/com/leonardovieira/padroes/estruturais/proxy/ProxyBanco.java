package br.com.guilhermevillaca.padroes.estruturais.proxy;

import java.util.HashMap;
import java.util.Map;

public class ProxyBanco implements ServicoBanco {

    private Banco bancoReal = new Banco();
    private Map<String, Double> saldoClientes = new HashMap<>();
    private Map<String, Boolean> cartaoAtivo = new HashMap<>();

    public ProxyBanco() {
        // Simulação de clientes com saldo e cartões ativos
        saldoClientes.put("João", 1000.00);
        saldoClientes.put("Maria", 500.00);
        cartaoAtivo.put("João", true);
        cartaoAtivo.put("Maria", false); // Maria tem cartão inativo
    }

    @Override
    public void processarPagamento(String cliente, double valor) {
        if (!cartaoAtivo.getOrDefault(cliente, false)) {
            System.out.println("Proxy: Transação negada! Cartão de " + cliente + " está inativo.");
            return;
        }

        double saldo = saldoClientes.getOrDefault(cliente, 0.0);
        if (saldo < valor) {
            System.out.println("Proxy: Transação negada! Saldo insuficiente para " + cliente);
            return;
        }

        // Se passar nas verificações, repassa ao banco real
        bancoReal.processarPagamento(cliente, valor);
        saldoClientes.put(cliente, saldo - valor); // Atualiza saldo
    }

}
