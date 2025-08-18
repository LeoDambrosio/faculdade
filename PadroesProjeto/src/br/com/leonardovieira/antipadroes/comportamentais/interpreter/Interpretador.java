package br.com.guilhermevillaca.antipadroes.comportamentais.interpreter;

public class Interpretador {
    public int interpretar(String expressao) {
        String[] partes = expressao.split(" ");
        int num1 = Integer.parseInt(partes[0]);
        String operador = partes[1];
        int num2 = Integer.parseInt(partes[2]);

        if (operador.equals("+")) {
            return num1 + num2;
        } else if (operador.equals("-")) {
            return num1 - num2;
        } else {
            throw new IllegalArgumentException("Operador desconhecido: " + operador);
        }
    }
}