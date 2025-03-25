package br.com.leonardovieira.exerciciop2;

public class contabancaria {

    private int numerodaconta;
    private String titular;
    private double saldo;

    public contabancaria(int numerodaconta, String titular, double saldo ){

        this.numerodaconta = numerodaconta;
        this.titular = titular;
        this.saldo = saldo;
    }

    public int getnumerodaconta() {
        return numerodaconta;
    }

    public void setNumeroDaConta(int numerodaconta) {
        this.numerodaconta = numerodaconta;
    }

    public String getTitular() {
        return titular;
    }

    public void setTitular(String titular) {
        this.titular = titular;
    }

    public double getSaldo() {
        return saldo;
    }

    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }
}

