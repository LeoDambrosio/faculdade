package br.com.leonardovieira.Interface.Exemplo1;

import java.util.ArrayList;
import java.util.List;

public class ContaBancaria implements OperacoesBancarias, Notificacoes, Relatorios {

    private double saldo;
    private List<String> historicoTransacoes;

    public ContaBancaria() {
        this.saldo = 0.0;
        this.historicoTransacoes = new ArrayList<>();
    }

    @Override
    public void depositar(double quantia) {
        saldo += quantia;
        historicoTransacoes.add("Depósito: " + quantia);
        enviarNotificacoes("Depósito de " + quantia + " realizado com sucesso.");
        
    }

    @Override
    public void sacar(double quantia) {
        if (quantia <= saldo) {
            saldo -= quantia;
            historicoTransacoes.add("Saque: " + quantia);
            enviarNotificacoes("Saque de " + quantia + " realizado com sucesso.");
        } else {
            enviarNotificacoes("Saldo insuficiente para saque de " + quantia);
        }
    }

    @Override
    public double consultarSaldo() {
        return saldo;

    }

    @Override
    public void enviarNotificacoes(String mensagem) {
        System.out.println("Notificação: " + mensagem);

    }

    public void gerarRelatorio() {
        System.out.println("Relatório de Transações:");
        for (String transacao : historicoTransacoes) {
            System.out.println(transacao);
        }
        System.out.println("Saldo atual: " + saldo);
    }
}
