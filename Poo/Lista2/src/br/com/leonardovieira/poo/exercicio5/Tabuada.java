package br.com.leonardovieira.poo.exercicio5;

public class Tabuada {
    private int numero;

    public void setNumero(int numero) {
        this.numero = numero;
    }


    public void calcularTabuada() {
        System.out.println("Tabuada do " + numero + ":");
        for (int i = 1; i <= 10; i++) {
            System.out.println(numero + " x " + i + " = " + (numero * i));
        }
    }
}
